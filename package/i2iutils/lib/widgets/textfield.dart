import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String? placeholder, labelText;
  Widget? suffixIcon;
  Widget? prefixIcon;
  EdgeInsets? contentPadding;
  int? maxLines, maxLength;
  bool? squareInput, readOnly, obsecureText;
  TextEditingController? controller;
  Color? fillColor;
  Function(String)? onChanged, onSubmitted;
  String Function(String?)? validator;
  Function()? onTab;
  TextInputAction? textInputAction;
  TextInputType? keyboardType;

  CustomTextField(
      {Key? key,
      this.placeholder,
      this.labelText,
      this.suffixIcon,
      this.prefixIcon,
      this.contentPadding,
      this.maxLines,
      this.squareInput = true,
      this.readOnly = false,
      this.controller,
      this.obsecureText = false,
      this.fillColor,
      this.onChanged,
      this.onTab,
      this.keyboardType,
      this.maxLength,
      this.textInputAction,
      this.onSubmitted,
      this.validator})
      : super(key: key);

  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      controller: controller,
      readOnly: readOnly ?? false,
      obscureText: obsecureText ?? false,
      maxLength: maxLength,
      maxLines: maxLines ?? 1,
      onChanged: onChanged,
      onTap: onTab,
      cursorColor: Colors.black,
      onFieldSubmitted:
          onSubmitted ?? (_) => FocusScope.of(context).nextFocus(),
      textInputAction: textInputAction ?? TextInputAction.next,
      keyboardType: keyboardType,
      validator: validator,
      style: const TextStyle(fontSize: 15),
      decoration: InputDecoration(
          filled: true,
          labelText: labelText,
          labelStyle: const TextStyle(
            fontSize: 12,
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          disabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          fillColor: fillColor ?? Colors.transparent,
          hintText: placeholder,
          contentPadding: contentPadding ?? const EdgeInsets.all(12),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon),
    );
  }
}
