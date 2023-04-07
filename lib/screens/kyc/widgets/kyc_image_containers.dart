import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paparless_tech_test/config/utils.dart';
import 'package:paparless_tech_test/constants/color.dart';

class KYCImageContainer extends StatelessWidget {
  final XFile? xFile;
  final String? imageId;
  final String? text;
  final VoidCallback? clear;
  final VoidCallback? getImage;
  const KYCImageContainer({Key? key, this.xFile, this.imageId, this.clear, this.text, this.getImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 170,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: AppColors.blueGrey
      ),
      child: xFile == null ? GestureDetector(
        onTap: getImage,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imageId!,
              height: 50,
              width: 70,
            ),
            Utils.verticalPadding(),
            Text(text!, style: GoogleFonts.oxygen(
              fontSize: 12,
              fontWeight: FontWeight.w600,

            ),)
          ],
        ),
      ) : Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
              child: defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS ? Image.file(File(xFile!.path,),
                height: 170,
                width: 300,
                fit: BoxFit.cover,
              ) : Image.network(xFile!.path,
                height: 170,
                width: 300,
                fit: BoxFit.contain,
              )
          ),
        ],
      ),
    );
  }
}
