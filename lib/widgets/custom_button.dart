import 'package:flutter/material.dart';
import 'custom_text.dart';
import 'package:smart_carboy/core/extensions/context_extension.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final double? height;
  final double? width;
  final Widget? child;
  final Color? textColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final Function()? onPressed;

  const CustomButton(
      {Key? key,
      this.text,
      this.child,
      this.textColor,
      this.backgroundColor,
      this.borderColor,
      required this.onPressed,
      this.height,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? context.dynamicWidth(1),
      padding: EdgeInsets.symmetric(vertical: 4),
      child: ElevatedButton(
          onPressed: onPressed ?? () {},
          child: text != null
              ? CustomText(text!, color: textColor ?? Color(0xff1D91D2))
              : child,
          style: ElevatedButton.styleFrom(
              primary: backgroundColor ?? Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ))),
    );
  }
}
