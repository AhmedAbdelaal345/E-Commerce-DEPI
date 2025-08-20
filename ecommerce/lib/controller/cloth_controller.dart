import 'package:ecommerce/model/clothes_model.dart';
import 'package:flutter/material.dart';

class ClothController extends ChangeNotifier {
  List<ClothesModel> _items = [];
  List<ClothesModel> _cartItems = [];
  List<ClothesModel> _wishList = [];

  ClothController() {
    _items = ClothesModel.getRealClothesData();
    _wishList = _items.where((item) => item.isFavorite).toList();
  }

  List<ClothesModel> get wishList => _wishList;
  List<ClothesModel> get items => _items;

  void toggleFavorite(ClothesModel item) {
    item.isFavorite = !item.isFavorite;
    _wishList = _items.where((element) => element.isFavorite).toList();
    notifyListeners(); 
  }

  void addItem(ClothesModel item) {
    if (!_cartItems.contains(item)) {
      _cartItems.add(item);
      item.isInCart = true;
      notifyListeners();
    }
  }

  void removeItem(ClothesModel item) {
    _cartItems.remove(item);
    item.isInCart = false;
    notifyListeners();
  }

  List<ClothesModel> get cartItems => _cartItems;
  void incrementQuantity(ClothesModel item){
    if(item.isInCart){
  item.incrementQuantity();
      notifyListeners();    }
  }
  void decrementQuantity(ClothesModel item) {
    if (item.isInCart) {
      if (item.quantity > 1) {
        item.decrementQuantity();
        notifyListeners();
      } else {
        removeItem(item);
      }
    }
  }
   double get totalCartPrice {
    return _cartItems
        .where((item) => item.isInCart)
        .fold(0.0, (total, item) => total + (item.price * item.quantity));
  }

  int get totalItemsInCart {
    return _cartItems
        .where((item) => item.isInCart)
        .fold(0, (total, item) => total + item.quantity);
  }
}
