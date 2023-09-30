import 'package:flutter/services.dart';
import 'package:pdf_downloader/app_environments/app_environments.dart';
import 'package:pdf_downloader/main.dart';

void main(){
  AppEnvironments.setUpEnvironment(Environments.prod);
  SystemChrome.setSystemUIOverlayStyle( const SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
  ));
  mainDelegateForEnvironments();
}