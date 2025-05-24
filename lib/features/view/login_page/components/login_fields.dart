import 'package:flutter/material.dart';
import 'package:news/common/widgets/shared_form_fields.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController userNameController;
  final TextEditingController passwordController;

  const LoginForm({
    super.key,
    required this.userNameController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        defaultFormField(
          showLabel: true,
          prefix: Icons.person,
          fillColor: Colors.transparent,
          borderColor: Colors.grey,
          context: context,
          controller: userNameController,
          type: TextInputType.text,
          label: 'Username',
        ),
        const SizedBox(height: 20),
        defaultFormField(
          isPassword: true,
          showLabel: true,
          prefix: Icons.lock_outline,
          fillColor: Colors.transparent,
          borderColor: Colors.grey,
          context: context,
          controller: passwordController,
          type: TextInputType.visiblePassword,
          label: 'Password',
        ),
      ],
    );
  }
}
