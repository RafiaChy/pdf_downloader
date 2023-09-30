import 'package:flutter/material.dart';
import 'package:pdf_downloader/common/assets_manager.dart';
import 'package:pdf_downloader/common/widgets/background_image_holder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          BackgroundImageHolder(height: height, imageAddress: AssetsManager.homeScreenBackground)
        ],
      ),
    );
  }
}
