import 'package:flutter/material.dart';

class SignInWithGoogleSection extends StatelessWidget {
  const SignInWithGoogleSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 24, bottom: 8),
          child: Text(
            "__Or Sign In With__",
            style: TextStyle(color: Colors.white),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                image: const DecorationImage(
                  image: AssetImage("images/google_icon.jpg"),
                  fit: BoxFit.scaleDown,
                )),
            height: 40,
            width: 40,
          ),
        )
      ],
    );
  }
}
