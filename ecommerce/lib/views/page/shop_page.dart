import 'package:ecommerce/controller/cloth_controller.dart';
import 'package:ecommerce/views/widget/list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});
  static const String id = "ShopPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shop Page')),
      body: Consumer<ClothController>(
        builder: (context, controller, child) {
          final shopList = controller.selledItem;
          return shopList.isEmpty
              ? const Center(child: Text('No items is selled'))
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
