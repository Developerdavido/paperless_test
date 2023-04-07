import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paparless_tech_test/config/utils.dart';
import 'package:paparless_tech_test/constants/color.dart';

class FAQItem extends StatefulWidget {
  final String? number;
  final String? title;
  final String? subtitle;
  const FAQItem({Key? key, this.title, this.subtitle, this.number}) : super(key: key);

  @override
  State<FAQItem> createState() => _FAQItemState();
}

class _FAQItemState extends State<FAQItem> {
  bool _onPressed = false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){
        setState(() {
          _onPressed = !_onPressed;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width > 500 ? 16 : 0 , vertical: 8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: AppColors.blueGrey,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(widget.number ?? "00",
                    style: GoogleFonts.oxygen(
                      fontSize: 16,
                      color: AppColors.grey,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Utils.horizontalPadding(space: 8),
                  SizedBox(
                    width: width > 600 ? null : width * 0.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.title ?? "" ,
                          style: GoogleFonts.oxygen(
                              fontSize: 16,
                              color: AppColors.black,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Utils.verticalPadding(space: 12),
                        Visibility(
                          visible: _onPressed,
                          child: Text(widget.subtitle ?? "",
                            style: GoogleFonts.oxygen(
                                fontSize: 12,
                                color: AppColors.black
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _onPressed ? Colors.red : Colors.white38
                ),
                child: Icon(_onPressed ? Icons.close : Icons.add,
                  color: _onPressed ? AppColors.white : AppColors.pink,
                  size: 12,
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
