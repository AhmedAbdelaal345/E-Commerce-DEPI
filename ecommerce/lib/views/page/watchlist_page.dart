import 'package:ecommerce/model/clothes_model.dart';
import 'package:ecommerce/views/widget/list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce/controller/cloth_controller.dart';

class WatchlistPage extends StatelessWidget {
  const WatchlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Watchlist')),
      body: Consumer<ClothController>(
        builder: (context, controller, child) {
          final wishList = controller.wishList;
          return wishList.isEmpty
              ? const Center(child: Text('No items in watchlist'))
              : ListView.builder(
                  itemCount: wishList.length,
                  itemBuilder: (context, index) {
                    return ListTileWidget(item: wishList[index]);
                  },
                );
        },
      ),
    );
  }
}