import 'package:ecommerce/helper/constants.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        focusColor: Constants.primarySearchColor,
        fillColor: Constants.primarySearchColor,
        label: Text(
          "Search",
          style: TextStyle(
            color: Constants.scondaryTextColor,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        prefixIcon: Icon(Icons.search, color: Constants.scondaryTextColor),
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Constants.primarySearchColor),
          borderRadius: BorderRadius.circular(12),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Constants.primarySearchColor),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Constants.primarySearchColor),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
