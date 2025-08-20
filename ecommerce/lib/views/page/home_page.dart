import 'package:ecommerce/controller/cloth_controller.dart';
import 'package:ecommerce/helper/constants.dart';
import 'package:ecommerce/model/clothes_model.dart';
import 'package:ecommerce/views/page/details_page.dart';
import 'package:ecommerce/views/widget/featured_container.dart';
import 'package:ecommerce/views/widget/gride_tile_widget.dart';
import 'package:ecommerce/views/widget/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static List<ClothesModel> cloth = ClothesModel.getRealClothesData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart_outlined),
          ),
        ],
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.view_headline)),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SearchTextField(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      FeaturedContainer(text: "ALL"),
                      SizedBox(width: MediaQuery.of(context).size.width / 20),
                      FeaturedContainer(text: "Featured"),
                      SizedBox(width: MediaQuery.of(context).size.width / 20),
                      FeaturedContainer(text: "New"),
                    ],
                  ),
                ),
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 2,
                    childAspectRatio: 0.52,
                  ),
                  shrinkWrap: true,
                  itemCount: cloth.length,
                  physics: NeverScrollableScrollPhysics(),

                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailsPage(
                                item: Provider.of<ClothController>(
                                  context,
                                  listen: false,
                                ).items[index],
                              );
                            },
                          ),
                        );
                      },
                      child: GrideTileWidget(item: cloth[index]),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
