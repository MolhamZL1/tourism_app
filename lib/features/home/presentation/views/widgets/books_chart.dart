import 'package:flutter/material.dart';

import '../../../../../core/functions/build_container_decoratin.dart';
import '../../../../../core/widgets/customDropDownButton.dart';
import '../../../../../core/widgets/custom_line_chart.dart';

class BooksChart extends StatefulWidget {
  const BooksChart({
    super.key,
  });

  @override
  State<BooksChart> createState() => _BooksChartState();
}

class _BooksChartState extends State<BooksChart> {
  String dropdownvalue = "Monthly";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: buildContainerDecoration(),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                "Books",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const Spacer(),
              CustomDropDownButton(
                dropdownvalue: dropdownvalue,
                onChanged: (value) {
                  setState(() {
                    dropdownvalue = value!;
                  });
                },
              )
            ],
          ),
          const FittedBox(
              fit: BoxFit.scaleDown,
              child: SizedBox(height: 250, child: LineChartSample2()))
        ],
      ),
    );
  }
}
