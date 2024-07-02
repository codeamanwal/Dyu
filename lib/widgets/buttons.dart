import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LargeButton extends StatelessWidget {
  final String? label;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final Color? buttonColor;
  final Function() onPressed;
  const LargeButton(
      {super.key,
      this.label,
      this.leadingIcon,
      this.trailingIcon,
      this.buttonColor,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: CupertinoButton(
          color: buttonColor ?? Colors.deepPurple,
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(leadingIcon),
              Text(
                label ?? "",
                style: TextStyle(color: Colors.white),
              ),
              Icon(trailingIcon)
            ],
          )),
    );
  }
}
