
import 'package:flutter/material.dart';
import 'package:innbucks/util/dimensiona.dart';

class CustomElevatedButton extends StatelessWidget {
  final double width;
  final double height;
  final String? text;
  final Color backgroundColor;
  final double borderRadius;
  final VoidCallback onPressed;
  final TextStyle? style;
  final Color? borderColor;
  final double? borderWidth;
  final double? elavation;
  final bool? leadingIcon;
  final IconData? icon;
  final Color? iconColor;

  CustomElevatedButton(

      {required this.width,
      required this.height,
      this.iconColor,
      this.text,
      required this.backgroundColor,
      required this.borderRadius,
      required this.onPressed,
      this.style,
      this.borderColor,
      this.leadingIcon,
      this.borderWidth,
      this.icon,
      this.elavation});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: elavation ?? 0,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: EdgeInsets.zero,
          side: BorderSide(
            color: borderColor ?? Colors.transparent,
            width: borderWidth ?? 0,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leadingIcon != null)
              Row(
                children: [
                  Icon(
                    icon ?? Icons.edit,
                    color:iconColor?? Colors.white,
                    size: 16,
                  ),
                SizedBox(width: Dimensions.defaultSpacing,)
                ],
              ),
              
            if (text != null)
              Text(
                text!,
                style: style,
              ),
          ],
        ),
      ),
    );
  }
}
