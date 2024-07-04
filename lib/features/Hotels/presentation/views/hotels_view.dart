import 'package:flutter/material.dart';
import 'package:tourism_app/features/Hotels/presentation/views/widgets/hotels_view_body.dart';

class HotelsView extends StatelessWidget {
  const HotelsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HotelsViewBody(),
    );
  }
}
