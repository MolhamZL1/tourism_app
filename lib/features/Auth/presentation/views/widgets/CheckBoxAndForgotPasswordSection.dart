import 'package:flutter/material.dart';
import 'package:tourism_app/features/Auth/presentation/views/widgets/forgot_password_text.dart';

class CheckBoxAndForgotPasswordSection extends StatelessWidget {
  const CheckBoxAndForgotPasswordSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: MediaQuery.of(context).size.width / 4),
        const ForgotPasswordText(),
      ],
    );
  }
}
