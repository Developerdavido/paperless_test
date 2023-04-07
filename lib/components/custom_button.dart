import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paparless_tech_test/constants/color.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onPressed;
  final double? radius;
  final Color? color;
  final double? height;
  final double? width;
  final bool? hasBorders;
  final bool? isLoading;
  final String? icon;
  final double? titleSize;
  final Color? titleColor;
  final Color? borderColor;
  const CustomButton(
      {Key? key,
      this.title,
      this.titleColor,
      this.titleSize,
      this.onPressed,
      this.isLoading = false,
      this.radius,
      this.color,
      this.hasBorders = false,
      this.icon,
      this.borderColor,
      this.height,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fullHeight = MediaQuery.of(context).size.height;
    final fullWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          height: fullHeight * (height ?? 0.05),
          width: fullWidth * (width ?? 1),
          decoration: BoxDecoration(
              color: color ?? AppColors.white,
              borderRadius: BorderRadius.circular(radius!),
              border: hasBorders!
                  ? Border.all(color: borderColor ?? Colors.grey[300]!)
                  : null),
          child: isLoading!
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.white,
                  ),
                )
              : Row(
                  mainAxisAlignment: icon == null
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.start,
                  children: [
                    icon == null
                        ? Container()
                        : SizedBox(
                            height: 30,
                            width: 30,
                            child: Image.asset(
                              icon!,
                              fit: BoxFit.contain,
                            ),
                          ),
                    icon == null ? Container() : const Spacer(),
                    Text(
                      title ?? "",
                      style: GoogleFonts.oxygen(
                          fontSize: titleSize ?? 18,
                          fontWeight: FontWeight.w600,
                          color: titleColor ?? AppColors.black),
                      overflow: TextOverflow.ellipsis,
                    ),
                    icon == null ? Container() : const Spacer(),
                  ],
                )),
    );
  }
}
