import 'package:ecommerce/helper/constants.dart';
import 'package:ecommerce/views/page/wrapper_page.dart';
import 'package:ecommerce/views/widget/elevated_button_widget.dart';
import 'package:ecommerce/views/widget/signup_text_widget.dart';
import 'package:ecommerce/views/widget/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
                ispassword: false,
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 23),
              TextFormFieldWidget(
                controller: _passwordController,
                ispassword: true,
                hintText: "Enter your Password",
                labelText: "PassWord",
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 23),

              ElevatedButtonWidget(
                
                text: "Login",
                onpressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Login successful!')),
                    );
                  Navigator.pushNamed(context, WrapperPage.id);
                  }
                },
              ),

              // here i try use DRY  and over Engineering principales
              SignupTextWidget(text: "Forgot Password?"),
              SignupTextWidget(text: "Sign Up"),
            ],
          ),
        ),
      ),
    );
  }
}
