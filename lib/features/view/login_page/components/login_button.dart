import 'package:flutter/material.dart';
import 'package:news/common/styles/app_style.dart';
import 'package:news/common/widgets/common_text.dart';
import 'package:news/util/app_constants/app_colors.dart';
import 'package:news/util/routes/router.dart';
import 'package:news/util/routes/routes_name.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          await AppRouter.pushNamedAndRemoveUntil(
            Routes.homePage,
            Routes.homePage,
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.blueColor,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: CommonText(text: 'Login', textStyle: Styles.whiteColorStyle18),
      ),
    );
  }
}
