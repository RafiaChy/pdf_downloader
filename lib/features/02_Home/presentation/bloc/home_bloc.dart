import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../common/string_manager.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<DownloadPdf>(_onDownloadPdf);
  }

  Future<FutureOr<void>> _onDownloadPdf(DownloadPdf event, Emitter<HomeState> emit) async {
    emit(HomeDownloading());
    try{
      String savePath = '';
      String fileName = '';
      List<String> parts = event.url.split('/');
      String lastPart = parts.last;
      int dotIndex = lastPart.lastIndexOf('.');

      if (dotIndex != -1) {
        String extractedName = lastPart.substring(0, dotIndex);
        fileName= extractedName;
      } else{
        fileName = StringManager.defaultPdfName;
      }

      if (Platform.isIOS) {
        final directory = await getApplicationDocumentsDirectory();
        savePath = '${directory.path}/$fileName.pdf';
      } else if (Platform.isAndroid) {
        savePath = '/storage/emulated/0/Download/$fileName.pdf';
      }

      var dio = Dio();

      dio.interceptors.add(LogInterceptor());

      var response = await dio.get(
        event.url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          receiveTimeout: const Duration(seconds: 10),
        ),
      );

      await Permission.manageExternalStorage.request();
      var file = File(savePath);
      var raf = file.openSync(mode: FileMode.write);

      raf.writeFromSync(response.data);
      await raf.close();
      emit( HomeDownloaded(filePathExtracted: file.path,));

    }catch(e){
     emit(HomeDownError(errorMessage: e.toString()));
    }
  }
}
