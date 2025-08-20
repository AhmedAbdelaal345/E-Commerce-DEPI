import 'package:flutter/foundation.dart';
import 'package:ecommerce/model/clothes_model.dart';

class ClothController extends ChangeNotifier {
  List<ClothesModel> _items = [];
  List<ClothesModel> _cartItems = [];
  List<ClothesModel> _wishList = [];
  List<ClothesModel> _selledItem = [];

  ClothController() {
    _items = ClothesModel.getRealClothesData();
    _wishList = _items.where((item) => item.isFavorite).toList();
  }

  List<ClothesModel> get wishList => _wishList;
  List<ClothesModel> get items => _items;
  List<ClothesModel> get selledItem => _selledItem;
  List<ClothesModel> get cartItems => _cartItems;

  void toggleFavorite(ClothesModel item) {
    item.isFavorite = !item.isFavorite;
    _wishList = _items.where((element) => element.isFavorite).toList();
    notifyListeners();
  }

  void toggleSelled(ClothesModel item) {
    if (item.isInCart && !item.isSelled) {
      item.isSelled = true;
      _selledItem.add(item);
      item.isInCart = false;
      _cartItems.remove(item);
      notifyListeners();
    }
  }

  void checkout() {
    final itemsToSell = _cartItems.where((item) => item.isInCart).toList();
    for (var item in itemsToSell) {
      toggleSelled(item);
    }

    notifyListeners();
  }

  void addItem(ClothesModel item) {
    if (!_cartItems.contains(item)) {
      _cartItems.add(item);
      item.isInCart = true;
      notifyListeners();
    }
  }

  void clear(ClothesModel item) {
    _cartItems.clear();
    for (var cartItem in _cartItems) {
      cartItem.isInCart = false;
    }
  }

  void removeItem(ClothesModel item) {
    _cartItems.remove(item);
    item.isInCart = false;
    notifyListeners();
  }

  void incrementQuantity(ClothesModel item) {
    if (item.isInCart) {
      item.incrementQuantity();
      notifyListeners();
    }
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
