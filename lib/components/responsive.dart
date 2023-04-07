import 'package:flutter/material.dart';


class ResponsiveLayout extends StatelessWidget {
  final Widget? desktop;
  final Widget? mobile;
  const ResponsiveLayout({Key? key, this.desktop, this.mobile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder
      (builder: (context, constraints){
      return constraints.maxWidth > 820 ? desktop! : mobile!;
    });
  }
}
