import 'package:ecommerce/helper/constants.dart';
import 'package:ecommerce/model/clothes_model.dart';
import 'package:ecommerce/views/widget/list_tile.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce/controller/cloth_controller.dart';

class WatchlistPage extends StatelessWidget {
  const WatchlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Watchlist',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<ClothController>(
        builder: (context, controller, child) {
          final wishList = controller.wishList;
          return wishList.isEmpty
              ? Center(
                  child: Column(
                    children: [
                      Lottie.asset(
                        Constants.emptyWishImage,
                        width: 300,
                        height: 300,
                      ),
                      SizedBox(height: 15),
                      Text(
                        'No item in watchlist',
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
