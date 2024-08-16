import 'package:flutter/material.dart';

class CustomRippledAnimation extends StatefulWidget {
  const CustomRippledAnimation({super.key, required this.icon});
  final IconData icon;
  @override
  State<CustomRippledAnimation> createState() => _CustomRippledAnimationState();
}

class _CustomRippledAnimationState extends State<CustomRippledAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      lowerBound: 0.2,
      duration: const Duration(seconds: 1),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation:
          CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn),
      builder: (context, child) {
        return CircleAvatar(
          backgroundColor: Colors.white,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              _buildContainer(40 * _controller.value),
              _buildContainer(50 * _controller.value),
              // _buildContainer(60 * _controller.value),
              // _buildContainer(70 * _controller.value),
              // _buildContainer(80 * _controller.value),
              Align(
                  child: Icon(
                widget.icon,
                color: Colors.black,
              )),
            ],
          ),
        );
      },
    );
  }

  Widget _buildContainer(double radius) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue.withOpacity(1 - _controller.value),
      ),
    );
  }
}
