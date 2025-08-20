import 'package:ecommerce/helper/constants.dart';
import 'package:flutter/material.dart';

class SignupTextWidget extends StatelessWidget {
  const SignupTextWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      child: Text(
        "$text",
        style: TextStyle(
          color: Constants.scondaryTextColor,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
