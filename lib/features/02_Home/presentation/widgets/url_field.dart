import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/string_manager.dart';

class UrlField extends StatelessWidget {
  const UrlField({
    super.key,
    required this.textEditingController,
    required this.height,
  });

  final TextEditingController textEditingController;
  final double height;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        errorStyle: GoogleFonts.fanwoodText( fontWeight: FontWeight.normal, fontSize: 17, color: Colors.red),
        fillColor: Colors.white,
        filled: true,
        hintText: StringManager.pasteUrl,
        hintStyle: GoogleFonts.fanwoodText( fontWeight: FontWeight.normal, fontSize: 17, color: Colors.red),
        contentPadding: EdgeInsets.all(height * 0.01),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide:  BorderSide(color: Colors.red.shade900)
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
    );
  }
}