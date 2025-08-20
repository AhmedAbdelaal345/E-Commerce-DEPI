import 'package:flutter/foundation.dart';
import 'package:ecommerce/model/register_model.dart';
import 'package:flutter/material.dart';

class RegiseterController extends ChangeNotifier {
  List<RegisterModel> _user = [];
  List<RegisterModel> get users => _user;
  String? _currentUserEmail;
  String? get currentUserEmail => _currentUserEmail;
  String? _currentUserPhone;
  String? get currentUserPhone => _currentUserPhone;
  void addUser(RegisterModel item) {
    if (!_user.contains(item)) {
      _user.add(item);
      notifyListeners();
      print('User added: ${item.email}');
    } else {
      print('User already exists: ${item.email}');
    }
  }

  RegisterModel? findUserByEmail(String email) {
    try {
      return _user.firstWhere((user) => user.email == email);
    } catch (e) {
      return null;
    }
  }

  void setCurrentUser(String email, String phone) {
    _currentUserEmail = email;
    _currentUserPhone = phone;
    notifyListeners();
  }
}
