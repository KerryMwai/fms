
import 'package:flutter/material.dart';
import 'package:fms/dammies/constants.dart';
import 'package:intl/intl.dart';

class WeatherCondition {
  final DateTime date;
  final double temperature;
  final double precipitation;
  final double humidity;
  final double windSpeed;

  WeatherCondition({
    required this.date,
    required this.temperature,
    required this.precipitation,
    required this.humidity,
    required this.windSpeed,
  });
}
class WeatherInformation extends StatelessWidget {
  const WeatherInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
        backgroundColor: blueGrey,
          title:const Text('Weather Information'),
        ),
        body: WeatherTable(),
      );
  }
}

class WeatherTable extends StatelessWidget {
  final List<WeatherCondition> weatherData = generateDummyData(60);

   WeatherTable({super.key});

  static List<WeatherCondition> generateDummyData(int count) {
    List<WeatherCondition> data = [];

    
    for (int i = 0; i < count; i++) {
      WeatherCondition weather = WeatherCondition(
        date: DateTime.now().subtract(Duration(days: i)),
        temperature: 25.0 + i.toDouble(),
        precipitation: 10.0 + i.toDouble(),
        humidity: 60.0 + i.toDouble(),
        windSpeed: 15.0 + i.toDouble(),
      );

      data.add(weather);
    }

    return data;
  }

  @override
  Widget build(BuildContext context) {
      return Container(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Table(
          border: TableBorder.all(width: 1.0, color: Colors.black),
          children: [
            const TableRow(
              decoration: BoxDecoration(color: Colors.grey),
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TableCell(child: Center(child: Text('Day', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)))),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TableCell(child: Center(child: Text('Month', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)))),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TableCell(child: Center(child: Text('Year', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)))),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TableCell(child: Center(child: Text('Temperature', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)))),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TableCell(child: Center(child: Text('Precipitation', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)))),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TableCell(child: Center(child: Text('Humidity', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)))),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TableCell(child: Center(child: Text('Wind Speed', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)))),
                ),
              ],
            ),
            for (var weather in weatherData)
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TableCell(child: Center(child: Text(weather.date.day.toString()))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TableCell(child: Center(child: Text(DateFormat('MMM').format(weather.date)))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TableCell(child: Center(child: Text(weather.date.year.toString()))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TableCell(child: Center(child: Text(weather.temperature.toString()))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TableCell(child: Center(child: Text(weather.precipitation.toString()))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TableCell(child: Center(child: Text(weather.humidity.toString()))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TableCell(child: Center(child: Text(weather.windSpeed.toString()))),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}