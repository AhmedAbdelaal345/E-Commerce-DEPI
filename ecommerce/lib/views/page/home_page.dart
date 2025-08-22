import 'package:ecommerce/controller/cloth_controller.dart';
import 'package:ecommerce/helper/constants.dart';
import 'package:ecommerce/views/page/details_page.dart';
import 'package:ecommerce/views/widget/featured_container.dart';
import 'package:ecommerce/views/widget/gride_tile_widget.dart';
import 'package:ecommerce/views/widget/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Page',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.view_headline),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SearchTextField(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      const FeaturedContainer(text: "ALL"),
                      SizedBox(width: MediaQuery.of(context).size.width / 20),
                      const FeaturedContainer(text: "Featured"),
                      SizedBox(width: MediaQuery.of(context).size.width / 20),
                      const FeaturedContainer(text: "New"),
                    ],
                  ),
                ),
                Consumer<ClothController>(
                  builder: (context, clothController, child) {
                    final cloth = clothController.searchItems;

                    // Show "no items found" message when search returns empty results
                    if (cloth.isEmpty &&
                        clothController.searchQuery.isNotEmpty) {
                      return SizedBox(
                        height: 300,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              LottieBuilder.asset(Constants.searchImage),
                              const SizedBox(height: 16),
                              Text(
                                'No items found for "${clothController.searchQuery}"',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Constants.scondaryTextColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                    }else{

                    // Show grid of items
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 2,
                            childAspectRatio: 0.52,
                          ),
                      shrinkWrap: true,
                      itemCount: cloth.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailsPage(item: cloth[index]),
                              ),
                            );
                          },
                          child: GrideTileWidget(item: cloth[index]),
                        );
                      },
                    );
                  }},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
