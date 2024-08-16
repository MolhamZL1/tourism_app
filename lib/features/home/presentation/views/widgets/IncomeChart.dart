import 'package:flutter/material.dart';

import '../../../../../core/functions/build_container_decoratin.dart';
import '../../../../../core/models/circle_chart_model.dart';
import '../../../../../core/widgets/customDropDownButton.dart';
import '../../../../../core/widgets/custom_circle_chart.dart';

class IncomeChart extends StatefulWidget {
  const IncomeChart({super.key});

  @override
  State<IncomeChart> createState() => _IncomeChartState();
}

class _IncomeChartState extends State<IncomeChart> {
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
                "Income",
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
          FittedBox(
              fit: BoxFit.scaleDown,
              child: SizedBox(
                  height: 250,
                  child: PieChartSample2(
                    circleChartModel: [
                      CircleChartModel(title: "Damascus", average: 20),
                      CircleChartModel(title: "Dubai", average: 30),
                      CircleChartModel(title: "Maldives", average: 15),
                      CircleChartModel(title: "Others", average: 45),
                    ],
                  )))
        ],
      ),
    );
  }
}
