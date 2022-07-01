import 'package:flutter/material.dart';
import 'package:floward/core/utils/helpers.dart';

class CustomText extends StatelessWidget {
  final String? title;
  final Color? color;
  final double? fontSize;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextDecoration? textDecoration;
  final double height;
  final Color? decorationColor;

  // ignore: use_key_in_widget_constructors
  const CustomText({
    final this.title,
    this.color,
    this.fontSize,
    this.textAlign,
    this.fontWeight,
    this.overflow,
    this.maxLines,
    this.textDecoration,
    this.height = 1.0,
    this.decorationColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "$title",
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: fontSize ?? (CheckTablet.isDeviceTablet() ? 20 : 16),
        fontFamily: 'Cairo',
        fontWeight: fontWeight,
        decoration: textDecoration,
        decorationColor: decorationColor,
        height: height,
      ),
      strutStyle: const StrutStyle(
        forceStrutHeight: true,
        fontFamily: 'Cairo',
      ),
    );
  }
}
