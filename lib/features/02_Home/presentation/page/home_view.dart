import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_filex/open_filex.dart';

import 'package:pdf_downloader/common/string_manager.dart';

import 'package:pdf_downloader/features/02_Home/presentation/bloc/home_bloc.dart';

import '../widgets/url_field.dart';

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
    return Container(
      decoration:  BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.red.shade900, Colors.white, Colors.red.shade900])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
      appBar: AppBar(

   backgroundColor: Colors.red.shade900,
        elevation: 0,
        automaticallyImplyLeading: false, //
        centerTitle: true,

        title: Text(StringManager.appName, style: GoogleFonts.sail(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold, )),

      ),
        body: Form(
          key: formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                margin: EdgeInsets.all(height * 0.02),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UrlField(textEditingController: textEditingController, height: height),
                     SizedBox(height: height* 0.01,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(height * 0.01),
                        child: IconButton(onPressed: (

                            ){
                          FocusManager.instance.primaryFocus?.unfocus();
                          if(formKey.currentState!.validate()) {

                            _homeBloc.add(DownloadPdf(url: textEditingController.text));
                          }
                        }, icon:  Icon( state is HomeInitial? Icons.download :
                        state is HomeDownloading ? Icons.downloading :
                        state is HomeDownloaded? Icons.download_done :
                        Icons.file_download_off,  color: Colors.red.shade900
                           ),)
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  },
),
),
);
  }
}


