import 'package:ecommerce/helper/constants.dart';
import 'package:flutter/material.dart';

class SignupTextWidget extends StatelessWidget {
  const SignupTextWidget({super.key, required this.text, this.ontap});
  final String text;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap ?? () {},
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 12),
        child: Text(
          "$text",
          style: TextStyle(
            color: Constants.scondaryTextColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
