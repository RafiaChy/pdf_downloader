import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_filex/open_filex.dart';
import 'package:pdf_downloader/common/assets_manager.dart';
import 'package:pdf_downloader/common/string_manager.dart';
import 'package:pdf_downloader/common/widgets/background_image_holder.dart';
import 'package:pdf_downloader/features/02_Home/presentation/bloc/home_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController textEditingController = TextEditingController();
  final HomeBloc _homeBloc = HomeBloc();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
  create: (context) => _homeBloc,
  child: BlocListener<HomeBloc, HomeState>(
  listener: (context, state) {
   if(state is HomeDownloaded){
     OpenFilex.open(state.filePathExtracted);
   }
  },
  child: BlocBuilder<HomeBloc, HomeState>(
  builder: (context, state) {
    return Scaffold(
    appBar: AppBar(

   backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false, //
      centerTitle: true,

      title: Text(StringManager.appName, style: GoogleFonts.sail(fontSize: 24,color: Colors.brown,fontWeight: FontWeight.bold, )),

    ),
      body: Form(
        key: formKey,
        child: Stack(
          fit: StackFit.expand,
          children: [
            BackgroundImageHolder(height: height, imageAddress: AssetsManager.homeScreenBackground),
            Container(
              margin: EdgeInsets.all(height * 0.02),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                      errorStyle: GoogleFonts.fanwoodText( fontWeight: FontWeight.normal, fontSize: 17, color: Colors.red),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: StringManager.pasteUrl,
                      hintStyle: GoogleFonts.fanwoodText( fontWeight: FontWeight.normal, fontSize: 17, color: Colors.brown),
                      contentPadding: EdgeInsets.all(height * 0.01),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(color: Colors.green)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(color: Colors.white)
                      ),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(color: Colors.red)
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(color: Colors.amber)
                      ),
                    ),
                    validator: (value){
                      if(value == null ){
                        return StringManager.urlWarning;
                      }else {
                        if(value.isEmpty){
                          return StringManager.urlWarning;
                        }else{
                          return null;
                        }
                      }
                    },
                  ),
                   SizedBox(height: height* 0.01,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.brown,
                    ),
                    padding: EdgeInsets.all(height * 0.01),
                      child: IconButton(onPressed: (
                          
                          ){
                        if(formKey.currentState!.validate()) {
                          _homeBloc.add(DownloadPdf(url: textEditingController.text));
                        }
                      }, icon:  Icon( state is HomeInitial? Icons.download :
                      state is HomeDownloading ? Icons.downloading :
                      state is HomeDownloaded? Icons.download_done :
                      Icons.file_download_off,  color: Colors.white
                         ),)
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  },
),
),
);
  }
}
