import 'package:pdf_downloader/app_environments/app_information.dart';

enum Environments {dev, prod}

class AppEnvironments{
 static Map<String,dynamic>? information;
 static Environments? environments;

 static void setUpEnvironment(Environments env){
   switch (env) {
     case Environments.dev:
       information = AppInformation.dev;
       environments = Environments.dev;
       break;
     case Environments.prod:
       information = AppInformation.prod;
       environments = Environments.prod;
       break;
   }
 }
}