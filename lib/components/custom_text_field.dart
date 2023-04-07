import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paparless_tech_test/constants/color.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? title;
  final String? labelText;
  final String? hintText;
  final bool? isPasswordField;
  final TextInputAction? inputAction;
  final double? titleTextSize;
  final double? hintFontSize;
  final double? labelFontSize;
  final double? iconSize;
  final double? borderRadius;
  final Widget? suffix;
  final bool? autofocus;
  final bool? enabled;
  final bool? filled;
  final double? height;
  final int? maxLines;
  final int? minLines;
  final Color? fillColor;
  final Color? focusedColor;
  final Color? borderColor;
  final TextInputType? keyboardType;
  final bool? isOutlineBorder;
  final String? Function(String?)? validate;
  const CustomTextField(
      {Key? key,
      this.controller,
      this.title,
      this.inputAction,
      this.isPasswordField = false,
      this.isOutlineBorder = true,
      this.titleTextSize,
      this.labelFontSize,
      this.hintFontSize,
      this.iconSize,
      this.validate,
        this.suffix,
        this.focusedColor,
      this.height = 60,
      this.labelText,
      this.keyboardType,
      this.fillColor,
      this.borderColor,
      this.filled = false,
      this.borderRadius = 8.0,
      this.enabled = true,
      this.autofocus = false,
      this.maxLines = 1,
      this.minLines = 1,
      this.hintText})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isVisible = true;
  @override
  Widget build(BuildContext context) {
    var outlineBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius!),
        borderSide:
        BorderSide(color: widget.borderColor ?? AppColors.grey));

    var underlineBorder = UnderlineInputBorder(
        borderSide: BorderSide(color: widget.borderColor ?? AppColors.grey),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _getTitle(),
        const SizedBox(
          height: 4,
        ),
        SizedBox(
          height: widget.height,
          child: TextFormField(
            controller: widget.controller,
            obscureText: widget.isPasswordField! ? _isVisible : false,
            decoration: InputDecoration(
              labelText: widget.labelText,
              hintText: widget.hintText,
              fillColor: widget.fillColor ?? Colors.transparent,
              filled: widget.filled,
              hintStyle: GoogleFonts.oxygen(
                  fontWeight: FontWeight.normal,
                  fontSize: widget.hintFontSize ?? 18,
                  color: AppColors.grey),
              labelStyle: GoogleFonts.oxygen(
                  fontWeight: FontWeight.normal,
                  fontSize: widget.labelFontSize ?? 18,
                  color: Colors.black),
              enabledBorder: widget.isOutlineBorder! ? outlineBorder : underlineBorder,
              disabledBorder: widget.isOutlineBorder! ? outlineBorder : underlineBorder,
              focusedBorder: widget.isOutlineBorder! ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius!),
                  borderSide: const BorderSide(color: AppColors.pink)) : const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.pink),
              ),
              suffix: widget.suffix,
              // suffix: widget.isPasswordField!
              //     ? GestureDetector(
              //         onTap: () {
              //           setState(() {
              //             _isVisible = !_isVisible;
              //           });
              //         },
              //         child: Icon(
              //           _isVisible ? Icons.visibility_off : Icons.visibility,
              //           color: AppColors.grey,
              //           size: widget.iconSize ?? 24,
              //         )) : null,
            ),
            obscuringCharacter: '*',
            keyboardType: widget.keyboardType,
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            validator: widget.validate,
            autofocus: widget.autofocus!,
            enabled: widget.enabled,
          ),
        )
      ],
    );
  }

  _getTitle() {
    if (widget.title != null) {
      return Text(
        widget.title!,
        style: GoogleFonts.oxygen(
            fontSize: widget.titleTextSize,
            color: AppColors.black,
            fontWeight: FontWeight.normal),
      );
    } else {
      return Container();
    }
  }
}
