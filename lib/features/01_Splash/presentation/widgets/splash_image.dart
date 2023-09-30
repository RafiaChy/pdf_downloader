import 'package:flutter/cupertino.dart';

import '../../../../common/assets_manager.dart';

class SplashImage extends StatelessWidget {
  const SplashImage({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Image.asset(AssetsManager.splashScreenBackground,fit: BoxFit.fill,),
    );
  }
}