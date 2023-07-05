import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fms/controller/model/animal_weight_model.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/repository/livestock_repository.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AnimalWeightAnalytics extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  final String animalid;
  const AnimalWeightAnalytics({Key? key, required this.animalid}) : super(key: key);

  @override
  AnimalWeightAnalyticsState createState() => AnimalWeightAnalyticsState();
}

class AnimalWeightAnalyticsState extends State<AnimalWeightAnalytics> {
  List<WeightData> data = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: blueGrey,
          title: const Text('Weight Analytics'),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: LivestockRepostory().getAllAnimalWeightSnapshotsForParticularAnimal(widget.animalid),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: green,
                  ),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    "An error occured",
                    style: TextStyle(color: red),
                  ),
                );
              }
              List<AnimalWeightModel> weightData = snapshot.data!.docs
                  .map((DocumentSnapshot document) =>
                      AnimalWeightModel.fromJson(
                          document.data() as Map<String, dynamic>))
                  .toList();
              for (var element in weightData) {
                final weightdata = WeightData(
                    DateFormat("MMMM").format(element.weightdate!),
                    element.weight);
                data.add(weightdata);
              }
              return Padding(
                padding: const EdgeInsets.all(15),
                child: Column(children: [
                  //Initialize the chart widget
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: SfCartesianChart(
                        primaryXAxis: CategoryAxis(),
                        // Chart title
                        title: ChartTitle(text: 'Weight Analytics of Animal ${widget.animalid}'),
                        // Enable legend
                        legend: Legend(isVisible: true),
                        // Enable tooltip
                        tooltipBehavior: TooltipBehavior(enable: true),
                        series: <ChartSeries<WeightData, String>>[
                          LineSeries<WeightData, String>(
                              dataSource: data,
                              xValueMapper: (WeightData weight, _) =>
                                  weight.year,
                              yValueMapper: (WeightData weight, _) =>
                                  weight.weight,
                              name: 'Kg',
                              // Enable data label
                              dataLabelSettings:
                                  const DataLabelSettings(isVisible: true))
                        ]),
                  ),
                ]),
              );
            }));
  }
}

class WeightData {
  WeightData(this.year, this.weight);

  final String year;
  final double weight;
}
