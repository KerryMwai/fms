import 'package:flutter/material.dart';
import 'package:fms/widgets/animal_health_monitoring.dart';

class LivestockHealthMonotoring extends StatefulWidget {
  const LivestockHealthMonotoring({super.key});

  @override
  State<LivestockHealthMonotoring> createState() =>
      _LivestockHealthMonotoringState();
}

class _LivestockHealthMonotoringState extends State<LivestockHealthMonotoring> {
  final List<IndividualAnimalHealth> animalHealthList = [
    IndividualAnimalHealth(
      animalId: 'Livestock-001',
      imageaddress:
          'https://cdn.pixabay.com/photo/2016/07/11/08/29/cow-1509258_640.jpg',
      bodyTemperature: 38.5,
      heartRate: 80,
      weight: 350.0,
      respiratoryRate: 20,
      status: "Sick",
    ),
    IndividualAnimalHealth(
      animalId: 'Livestock-002',
      imageaddress:
          'https://cdn.pixabay.com/photo/2013/12/28/19/28/cow-234835_640.jpg',
      bodyTemperature: 37.9,
      heartRate: 70,
      weight: 420.0,
      respiratoryRate: 18,
      status: "Health",
    ),
    IndividualAnimalHealth(
      animalId: 'Livestock-003',
      imageaddress:
          'https://cdn.pixabay.com/photo/2016/07/11/08/29/cow-1509258_640.jpg',
      bodyTemperature: 34.7,
      heartRate: 80,
      weight: 320.0,
      respiratoryRate: 25,
      status: "Sick",
    ),
    IndividualAnimalHealth(
      animalId: 'Livestock-004',
      imageaddress:
          'https://cdn.pixabay.com/photo/2013/12/28/19/28/cow-234835_640.jpg',
      bodyTemperature: 38.9,
      heartRate: 69,
      weight: 450.0,
      respiratoryRate: 21,
      status: "Health",
    ),
    IndividualAnimalHealth(
      animalId: 'Livestock-005',
      imageaddress:
          'https://cdn.pixabay.com/photo/2016/07/11/08/29/cow-1509258_640.jpg',
      bodyTemperature: 39.5,
      heartRate: 68,
      weight: 390.0,
      respiratoryRate: 19,
      status: "Health",
    ),
    IndividualAnimalHealth(
      animalId: 'Livestock-006',
      imageaddress:
          'https://cdn.pixabay.com/photo/2013/12/28/19/28/cow-234835_640.jpg',
      bodyTemperature: 31.7,
      heartRate: 73,
      weight: 380.0,
      respiratoryRate: 23,
      status: "Sick",
    ),
    // Add more IndividualAnimalHealth instances as needed
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: animalHealthList.length,
      itemBuilder: (context, index) {
        return animalHealthList[index];
      },
    );
  }
}
