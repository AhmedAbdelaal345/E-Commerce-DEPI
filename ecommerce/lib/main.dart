import 'package:ecommerce/controller/cloth_controller.dart';
import 'package:ecommerce/helper/constants.dart';
import 'package:ecommerce/views/page/details_page.dart';
import 'package:ecommerce/views/page/login_page.dart';
import 'package:ecommerce/views/page/wrapper_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ClothController(),
      child: MaterialApp(
        title: 'E-commerce App',
        theme: ThemeData(
          scaffoldBackgroundColor: Constants.primaryBackgroundColor,
          appBarTheme: AppBarTheme(
            backgroundColor: Constants.primaryBackgroundColor,
          ),
        ),
        home: LoginPage(),
        routes: {WrapperPage.id: (context) => WrapperPage()},
      ),
    );
  }
}
