import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paparless_tech_test/constants/color.dart';
import 'package:paparless_tech_test/view_models/base_provider.dart';

class SelectDocumentType extends StatefulWidget {
  final BaseProvider? baseProvider;
  const SelectDocumentType({Key? key, this.baseProvider}) : super(key: key);

  @override
  State<SelectDocumentType> createState() => _SelectDocumentTypeState();
}

class _SelectDocumentTypeState extends State<SelectDocumentType> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: SizedBox(
          height: 50,
          child: PopupMenuButton(
            position: PopupMenuPosition.under,
            elevation: 2,
            offset: const Offset(0, 8),
            itemBuilder: (BuildContext context) {
              return widget.baseProvider!.docTypes
                  .map((e) => PopupMenuItem(
                        value: e,
                        child: Text(
                          e,
                          style: GoogleFonts.oxygen(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              color: AppColors.black),
                        ),
                      ))
                  .toList();
            },
            onSelected: (value){
              widget.baseProvider!.getSelectedDocument(value);
              log(widget.baseProvider!.docSelected!);
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppColors.pink, width: 1),
                  color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.baseProvider!.docSelected!,
                    style: GoogleFonts.oxygen(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: AppColors.black),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down_outlined,
                    size: 14,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
