import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/string_manager.dart';

class SplashText extends StatelessWidget {
  const SplashText({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
              // color: Colors.black45,
              borderRadius: BorderRadius.circular(10)

          ),
          padding: EdgeInsets.all(height * 0.01),
          margin: EdgeInsets.all(height * 0.01),
          child: Wrap(
            children: [
              Text(
                  StringManager.appName,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: GoogleFonts.fanwoodText(color: Colors.red.shade900, fontSize: height * 0.05, fontWeight: FontWeight.normal)
              ),
            ],
          ),
        ),
        SizedBox(height: height * 0.3,)

      ],
    );
  }
}