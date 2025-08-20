import 'package:ecommerce/controller/cloth_controller.dart';
import 'package:ecommerce/helper/constants.dart';
import 'package:ecommerce/model/clothes_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GrideTileWidget extends StatefulWidget {
  GrideTileWidget({super.key, required this.item});
  ClothesModel item;

  @override
  State<GrideTileWidget> createState() => _GrideTileWidgetState();
}

class _GrideTileWidgetState extends State<GrideTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 240,
              height: 240,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.item.image),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  widget.item.isInCart = !widget.item.isInCart;
                });
                if (widget.item.isInCart) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '${widget.item.title} added to watched list',
                        style: TextStyle(color: Colors.black),
                      ),
                      backgroundColor: Constants.scondaryTextColor,
                      duration: Duration(seconds: 1),
                    ),
                  );
                  Provider.of<ClothController>(
                    context,
                    listen: false,
                  ).addItem(widget.item);
                } else {
                  Provider.of<ClothController>(
                    context,
                    listen: false,
                  ).removeItem(widget.item);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '${widget.item.title} removed from watched list',
                      ),
                      backgroundColor: Constants.scondaryTextColor,
                      duration: Duration(seconds: 1),
                    ),
                  );
                }
              },
              icon: widget.item.isInCart
                  ? Icon(Icons.shopping_cart, color: Colors.black)
                  : Icon(Icons.shopping_cart_outlined, color: Colors.black),
            ),
          ],
        ),
        Text(
          widget.item.title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.left,
        ),
        Align(
          alignment: AlignmentGeometry.centerLeft,
          child: Text(
            "${widget.item.price} \$",
            style: TextStyle(
              color: Constants.scondaryTextColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
