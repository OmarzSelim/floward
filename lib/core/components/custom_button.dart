import 'package:floward/core/components/custom_text.dart';
import 'package:floward/core/utils/helpers.dart';

import '../utils/theme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? label;
  final Function()? onTap;
  final double? mdw;
  final Color? color;
  final Color? textColor;
  final double? mdh;
  final IconData? icon;
  final double iconSize;
  final double radius;
  final bool isFixed;
  final Color? borderColor;
  const CustomButton({
    Key? key,
    this.onTap,
    this.label,
    this.mdw,
    this.mdh,
    this.color,
    this.textColor,
    this.icon,
    this.iconSize = 24,
    this.radius = 5,
    this.isFixed = true,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(
            minWidth: mdw ?? MediaQuery.of(context).size.width * .3),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: onTap == null
              ? const Color.fromRGBO(224, 224, 224, 1)
              : color ?? CustomThemes.appTheme.primaryColor,
          border:
              Border.all(color: borderColor ?? Colors.transparent, width: 2),
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: icon == null ? 0 : iconSize,
            ),
            SizedBox(width: icon == null ? 0 : 15),
            CustomText(
              title: "$label",
              color: textColor ?? Colors.white,
              fontSize: CheckTablet.isDeviceTablet() ? 20 : 14,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
