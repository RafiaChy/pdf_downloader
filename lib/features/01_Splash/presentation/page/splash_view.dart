import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pdf_downloader/features/01_Splash/presentation/bloc/splash_bloc.dart';
import '../../../../common/assets_manager.dart';
import '../widgets/splash_text.dart';

class SplashView extends StatelessWidget {
   SplashView({super.key});
  final SplashBloc _splashBloc = SplashBloc();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
  create: (context) => _splashBloc..add(BringSplashScreen(context: context)),
  child: BlocConsumer<SplashBloc, SplashState>(
  listener: (context, state) {

  },
  builder: (context, state) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [

              Colors.red.shade900,
              Colors.white,
              Colors.red.shade900,
            ],
          ),),child: Center(child:    SplashText(height: height)),)

    );
  },
),
);
  }
}




