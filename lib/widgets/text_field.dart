import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String label;
  final String hintText;
  final TextInputType? inputType;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final Function()? onTrailingIconPressed;
  final bool? hideText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;

  InputText({
    Key? key,
    required this.label,
    required this.hintText,
    this.inputType,
    this.leadingIcon,
    this.trailingIcon,
    this.onTrailingIconPressed,
    this.hideText,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        obscureText: this.hideText ?? false,
        validator: validator,
        decoration: InputDecoration(
          prefixIcon: leadingIcon != null ? Icon(leadingIcon) : null,
          suffixIcon: IconButton(
              onPressed: onTrailingIconPressed, icon: Icon(trailingIcon)),
          label: Text(label),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          fillColor: Colors.white.withOpacity(0.9),
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
      ),
    );
  }
}
