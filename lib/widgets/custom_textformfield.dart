import 'package:flutter/material.dart';

class reusableTextField extends StatelessWidget {
  reusableTextField(
      {super.key,
      required this.controller,
      this.keyboardType,
      this.iconButton,
      this.icon,
      required this.isPassword,
      required this.text,
      this.onFeildSubmitted});
  TextEditingController controller = TextEditingController();
  TextInputType? keyboardType;
  IconButton? iconButton;
  Icon? icon;
  bool isPassword;
  String text;
  void Function(String)? onFeildSubmitted;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        onFieldSubmitted: onFeildSubmitted,
        controller: controller,
        cursorColor: Colors.black,
        keyboardType: keyboardType,
        obscureText: isPassword,
        validator: (value) {
          if (value!.isEmpty) {
            return 'You Must Enter a value';
          }
          return null;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide: const BorderSide(
                color: Colors.white,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide: const BorderSide(
                color: Colors.white,
              )),
          prefixIcon: icon,
          suffixIcon: iconButton,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide: const BorderSide(color: Colors.white)),
          hintText: text,
        ),
      ),
    );
  }
}
