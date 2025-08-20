import 'package:ecommerce/controller/cloth_controller.dart';
import 'package:ecommerce/helper/constants.dart';
import 'package:ecommerce/views/widget/list_tile.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});
  static const String id = "ShopPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Shop Page',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Consumer<ClothController>(
        builder: (context, controller, child) {
          final shopList = controller.selledItem;
          return shopList.isEmpty
              ? Center(
                  child: Column(
                    children: [
                      Lottie.asset(Constants.emptyImage),
                      Text(
                        'No items is Selled',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Constants.scondaryTextColor,
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: shopList.length,
                  itemBuilder: (context, index) {
                    return ListTileWidget(item: shopList[index]);
                  },
                );
        },
      ),
    );
  }
}
