import 'package:ecommerce/controller/cloth_controller.dart';
import 'package:ecommerce/helper/constants.dart';
import 'package:ecommerce/model/clothes_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListTileWidget extends StatelessWidget {
  @override
  const ListTileWidget({super.key, required this.item});
  final ClothesModel item;
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 56,
        height: 56,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: AssetImage(item.image),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
        item.title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        "${item.price}",
        style: TextStyle(
          color: Constants.scondaryTextColor,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: SizedBox(
        width: 120,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                context.read<ClothController>().incrementQuantity(item);
              },
              icon: Icon(Icons.add),
            ),
            Text(
              "${item.quantity}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            IconButton(
              onPressed: () {
                if (item.quantity == 0) {
                  context.read<ClothController>().removeItem(item);
                  item.isInCart = false;
                } else {
                  context.read<ClothController>().decrementQuantity(item);
                }
              },
              icon: Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
