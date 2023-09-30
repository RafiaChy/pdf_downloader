import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:pdf_downloader/common/route_manager.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<BringSplashScreen>(_onBringSplashScreen);
  }

  Future<FutureOr<void>> _onBringSplashScreen(BringSplashScreen event, Emitter<SplashState> emit) async {
    emit(SplashLoaded());
    await Future.delayed(const Duration(seconds: 10), (){
      emit(SplashExit());
      Navigator.pushNamed(event.context, RouteName.homeRoute);
    });
  }
}
