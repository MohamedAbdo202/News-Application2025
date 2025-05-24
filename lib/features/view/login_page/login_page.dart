import 'package:flutter/material.dart';
import 'package:news/common/styles/app_style.dart';
import 'package:news/common/widgets/common_text.dart';
import 'package:news/features/view/login_page/components/login_button.dart';
import 'package:news/features/view/login_page/components/login_fields.dart';
import 'package:news/util/app_constants/app_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            CommonText(
                text: 'Welcome Back', textStyle: Styles.blackColorStyle24),
            CommonText(
                text: 'Discover news & articles',
                textStyle: Styles.blackColorStyle24),
            const SizedBox(height: 20),
            Center(
              child: Image.asset(
                'assets/images/login_logo.jpg',
                height: 225,
              ),
            ),
            const SizedBox(height: 25),
            LoginForm(
              userNameController: userNameController,
              passwordController: passwordController,
            ),
            const SizedBox(height: 30),
            const LoginButton(),
            const SizedBox(height: 20),
            Center(
              child: TextButton(
                onPressed: () {},
                child: CommonText(
                  text: 'Forgot Password?',
                  textStyle: Styles.blackColorStyle15
                      .copyWith(color: AppColors.blueColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
