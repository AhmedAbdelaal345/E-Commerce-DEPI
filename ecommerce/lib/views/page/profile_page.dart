import 'package:ecommerce/controller/regiseter_controller.dart';
import 'package:ecommerce/helper/constants.dart';
import 'package:ecommerce/views/page/login_page.dart';
import 'package:ecommerce/views/widget/elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  static const String profileId = "Profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height/5,),
          Center(
            child: CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(Constants.profileImage),
            ),
          ),
          Text(
            "${Provider.of<RegiseterController>(context, listen: false).currentUserEmail}",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 25),
          Text(
            "Phone Number: ${Provider.of<RegiseterController>(context, listen: false).currentUserPhone}",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.redAccent,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 20),          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: ElevatedButtonWidget(
              text: "Log out",
              onpressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const LoginPage(),
                  ),
                  ModalRoute.withName(LoginPage.id),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
