import 'package:ecommerce/controller/cloth_controller.dart';
import 'package:ecommerce/helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  TextEditingController searchController = TextEditingController();
  void _onSearchChanged(String query) {
    final clothController = Provider.of<ClothController>(
      context,
      listen: false,
    );
    clothController.searchItemsMethod(query);
  }

  void _clearSearch() {
    searchController.clear();
    final clothController = Provider.of<ClothController>(
      context,
      listen: false,
    );
    clothController.clearSearch();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      onChanged: _onSearchChanged,
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
        suffixIcon: searchController.text.isNotEmpty
            ? IconButton(
                onPressed: _clearSearch,
                icon: Icon(Icons.clear, color: Constants.scondaryTextColor),
              )
            : null,
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
