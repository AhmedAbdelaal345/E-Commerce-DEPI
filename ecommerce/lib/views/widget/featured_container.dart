import 'package:ecommerce/helper/constants.dart';
import 'package:flutter/material.dart';

class FeaturedContainer extends StatelessWidget {
  const FeaturedContainer({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      
      
      decoration: BoxDecoration(
        color: Constants.primarySearchColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding:const EdgeInsets.symmetric(horizontal: 8,vertical: 16),
        child: Center(
          
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
