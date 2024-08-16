import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:tourism_app/core/models/circle_chart_model.dart';

import 'indecator.dart';

const Color dayColor = Color(0xff67c6ea);
const Color weekColor = Color.fromARGB(255, 11, 173, 176);
const Color monthColor = Color(0xff67e7ea);
const Color yearColor = Colors.grey;

class PieChartSample2 extends StatefulWidget {
  const PieChartSample2({super.key, required this.circleChartModel});
  final List<CircleChartModel> circleChartModel;

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State<PieChartSample2> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Row(
        children: <Widget>[
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: showingSections(widget.circleChartModel),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Indicator(
                color: monthColor,
                text: widget.circleChartModel[0].title,
                isSquare: true,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: dayColor,
                text: widget.circleChartModel[1].title,
                isSquare: true,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: weekColor,
                text: widget.circleChartModel[2].title,
                isSquare: true,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: yearColor,
                text: widget.circleChartModel[3].title,
                isSquare: true,
              ),
              SizedBox(
                height: 18,
              ),
            ],
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections(
      List<CircleChartModel> circleChartModel) {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: yearColor,
            value: circleChartModel[3].average,
            title: '${circleChartModel[3].average}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: monthColor,
            value: circleChartModel[0].average,
            title: '${circleChartModel[0].average}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: weekColor,
            value: circleChartModel[2].average,
            title: '${circleChartModel[2].average}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: dayColor,
            value: circleChartModel[1].average,
            title: '${circleChartModel[1].average}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}
