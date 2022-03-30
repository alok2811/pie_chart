import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'indicator.dart';



class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    final List<ChartData> chartData = [
      ChartData(nameX: 'Partially Vaccinated', dataY: 1047889, color: Colors.green),
      ChartData(nameX: 'Fully Vaccinated', dataY: 1015633, color: Colors.red),
    ];

    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: SfCircularChart(
                  series: <CircularSeries>[
                    // Renders doughnut chart
                    DoughnutSeries<ChartData, String>(
                        dataSource: chartData,
                        pointColorMapper:(ChartData data,  _) => data.color,
                        xValueMapper: (ChartData data, _) => data.nameX,
                        yValueMapper: (ChartData data, _) => data.dataY
                    )
                  ]
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: const[

                    Indicator(
                      color: Colors.green,
                      text: 'Partially Vaccinated',
                      isSquare: true,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Indicator(
                      color: Colors.red,
                      text: 'Fully Vaccinated',
                      isSquare: true,
                    ),
                    SizedBox(
                      height: 4,
                    ),

                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}

class ChartData {
  ChartData({required this.nameX, required this.dataY,required this.color});
  final String nameX;
  final double dataY;
  final Color color;
}
