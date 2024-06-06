import 'package:flutter/material.dart';

class AnimatedImage extends StatelessWidget {
  const AnimatedImage({
    super.key,
    required this.slidingAnimationImage,
  });

  final Animation<Offset> slidingAnimationImage;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: slidingAnimationImage,
      child: RotationTransition(
        turns: const AlwaysStoppedAnimation(-45 / 360),
        child: Image.asset(
          "images/plane.png",
        ),
      ),
    );
  }
}
