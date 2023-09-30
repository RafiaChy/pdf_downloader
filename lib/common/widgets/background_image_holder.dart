import 'package:flutter/cupertino.dart';

import '../../../../common/assets_manager.dart';

class BackgroundImageHolder extends StatelessWidget {
  const BackgroundImageHolder({
    super.key,
    required this.height, required this.imageAddress,
  });

  final double height;
  final String imageAddress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Image.asset(imageAddress,fit: BoxFit.fill,),
    );
  }
}