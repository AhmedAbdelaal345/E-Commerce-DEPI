import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget({
    super.key,
    required this.controller,
    this.labelText = 'Email',
    this.hintText = 'Enter Your Email',

    required this.ispassword,
  });

  final TextEditingController controller;
  final String labelText;
  final String hintText;

  final bool ispassword;

  static const String standardEmailRegex =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  // 2. Medium Password (8+ chars, at least one letter and one number)
  static const String mediumPasswordRegex =
      r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$';

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  bool isScure = false;
  bool isShow = false;
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "The Email is required";
    }

    final email = RegExp(TextFormFieldWidget.standardEmailRegex);
    if (!email.hasMatch(value)) {
      return "Please enter a valid email address";
    }

    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "The PassWord is required";
    }

    final email = RegExp(TextFormFieldWidget.mediumPasswordRegex);
    if (!email.hasMatch(value)) {
      return "Please enter a valid Password address";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isShow,
      controller: widget.controller,
      validator: widget.ispassword ? _validatePassword : _validateEmail,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(color: Colors.grey.shade500, fontSize: 16),
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
        suffixIcon: widget.ispassword
            ? IconButton(
                onPressed: () {
                  isShow = !isShow;
                  setState(() {});
                },
                icon: isShow
                    ? const Icon(Icons.visibility_off, color: Colors.grey)
                    : const Icon(Icons.visibility, color: Colors.grey),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }
}
