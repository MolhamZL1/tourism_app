import 'package:flutter/material.dart';
import 'package:tourism_app/features/home/presentation/views/widgets/books_chart.dart';

import '../../../../../core/functions/build_container_decoratin.dart';
import 'IncomeChart.dart';

class Charts extends StatelessWidget {
  const Charts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      children: [
        Container(
          decoration: buildContainerDecoration(),
          child: const IncomeChart(),
        ),
        const SizedBox(height: 32),
        Container(
          decoration: buildContainerDecoration(),
          child: const BooksChart(),
        ),
      ],
    );
  }
}
