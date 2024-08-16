import 'package:flutter/material.dart';

class SliverNotFoundImage extends StatelessWidget {
  const SliverNotFoundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Not Found",
          style: TextStyle(
              color: Colors.red, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        FittedBox(
            fit: BoxFit.scaleDown,
            child: Image.asset(
                height: MediaQuery.of(context).size.height * .3,
                "images/undraw_Searching_re_3ra9.png")),
      ],
    ));
  }
}
