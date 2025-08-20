import 'package:ecommerce/controller/regiseter_controller.dart';
import 'package:ecommerce/helper/constants.dart';
import 'package:ecommerce/model/register_model.dart';
import 'package:ecommerce/views/page/login_page.dart';
import 'package:ecommerce/views/page/wrapper_page.dart';
import 'package:ecommerce/views/widget/elevated_button_widget.dart';
import 'package:ecommerce/views/widget/signup_text_widget.dart';
import 'package:ecommerce/views/widget/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  static String id = "Signup";

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  late final RegisterModel item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  Constants.loginImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 3,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    "Shop Smart",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                TextFormFieldWidget(
                  controller: _emailController,
                  isPassword: false,
                  isEmail: true,
                  hintText: "Enter your Email",
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 23),
                TextFormFieldWidget(
                  controller: _passwordController,
                  isPassword: true,
                  hintText: "Enter your Password",
                  labelText: "PassWord",
                  isEmail: false,
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 23),
                TextFormFieldWidget(
                  controller: _phoneController,
                  isPassword: false,
                  hintText: "Enter your Phone Number",
                  labelText: "Phone Number",
                  isEmail: false,
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 23),
                ElevatedButtonWidget(
                  text: "Sign Up",
                  onpressed: () {
                    final newUser = RegisterModel(
                      email: _emailController.toString().trim(),
                      password: _passwordController.toString().trim(),
                      phone: _phoneController.toString().trim(),
                    );
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('SignUp Successful!')),
                      );
                      Provider.of<RegiseterController>(
                        context,
                        listen: false,
                      ).addUser(newUser);
                      Provider.of<RegiseterController>(
                        context,
                        listen: false,
                      ).setCurrentUser(
                        _emailController.text.trim(),
                        _phoneController.text.trim(),
                      );

                      Navigator.pushNamed(context, WrapperPage.id);
                    }
                  },
                ),

                // here i try use DRY  and over Engineering principales
                SignupTextWidget(
                  text: "Have account login now ?",
                  ontap: () {
                    Navigator.pushNamed(context, LoginPage.id);
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
