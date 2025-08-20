import 'package:ecommerce/helper/constants.dart';
import 'package:ecommerce/views/page/cart_page.dart';
import 'package:ecommerce/views/page/home_page.dart';
import 'package:ecommerce/views/page/profile_page.dart';
import 'package:ecommerce/views/page/shop_page.dart';
import 'package:ecommerce/views/page/watchlist_page.dart';
import 'package:flutter/material.dart';

class WrapperPage extends StatefulWidget {
  WrapperPage({super.key});

  @override
  static const String id = "wrapper_page";
  State<WrapperPage> createState() => _WrapperPageState();
}

class _WrapperPageState extends State<WrapperPage> {
  List<Widget> pages = const [
    HomePage(),
    ShopPage(),
    WatchlistPage(),
    CartPage(),
    ProfilePage(),
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Required for more than 3 items
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Constants.scondaryTextColor,
        currentIndex: index, // This is required
        onTap: (selectedIndex) {
          // This handles the navigation
          setState(() {
            index = selectedIndex;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: index == 0
                ? const Icon(Icons.home)
                : const Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: index == 1
                ? const Icon(Icons.search_outlined)
                : const Icon(Icons.search),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: index == 2
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_border_outlined),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: index == 3
                ? const Icon(Icons.shopping_cart)
                : const Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: index == 4
                ? const Icon(Icons.person)
                : Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
