


import 'package:flutter/material.dart';
import 'package:fms/dammies/constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class AnimalWeightAnalytics extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  AnimalWeightAnalytics({Key? key}) : super(key: key);

  @override
  AnimalWeightAnalyticsState createState() => AnimalWeightAnalyticsState();
}

class AnimalWeightAnalyticsState extends State<AnimalWeightAnalytics> {
  List<WeightData> data = [
    WeightData('Jan', 430),
    WeightData('Feb', 428),
    WeightData('Mar', 442),
    WeightData('Apr', 435),
    WeightData('May', 420),
    WeightData('June', 385),
    WeightData('July', 410),
    WeightData('August', 400)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: blueGrey,
          title: const Text('Weight Analytics'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(children: [
            //Initialize the chart widget
            SizedBox(
              height: MediaQuery.of(context).size.height*0.8,
              child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  // Chart title
                  title: ChartTitle(text: 'Weight Analytics of Animal X'),
                  // Enable legend
                  legend: Legend(isVisible: true),
                  // Enable tooltip
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <ChartSeries<WeightData, String>>[
                    LineSeries<WeightData, String>(
                        dataSource: data,
                        xValueMapper: (WeightData weight, _) => weight.year,
                        yValueMapper: (WeightData weight, _) => weight.weight,
                        name: 'Kg',
                        // Enable data label
                        dataLabelSettings: const DataLabelSettings(isVisible: true))
                  ]),
            ),
          ]),
        ));
  }
}

class WeightData {
  WeightData(this.year, this.weight);

  final String year;
  final double weight;
}