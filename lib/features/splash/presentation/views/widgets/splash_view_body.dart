import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourism_app/core/functions/back_ground_image.dart';
import 'package:tourism_app/core/shared/shared.dart';
import 'package:tourism_app/core/utils/go_route.dart';
import 'package:tourism_app/features/splash/presentation/views/widgets/animated_image.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimationImage;
  @override
  void initState() {
    super.initState();
    initAnmation();
    initnavigation();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundimage(),
      width: double.infinity,
      height: double.infinity,
      child: AnimatedImage(slidingAnimationImage: slidingAnimationImage),
    );
  }

  Future<void> initnavigation() async {
    String? token = await CacheNetwork.getCacheData(key: 'token');
    Future.delayed(
      const Duration(milliseconds: 3000),
      () => token == null
          ? GoRouter.of(context).pushReplacement(Routes.kloginView)
          : GoRouter.of(context).pushReplacement(Routes.khomeView),
    );
  }

  void initAnmation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    slidingAnimationImage =
        Tween<Offset>(begin: const Offset(0, 2), end: const Offset(0, -2))
            .animate(animationController);
    animationController.forward();
    slidingAnimationImage.addListener(() {
      setState(() {});
    });
  }
}
