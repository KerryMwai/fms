import 'package:flutter/material.dart';
import 'package:fms/dammies/constants.dart';

class IndividualAnimalHealth extends StatefulWidget {
  final String animalId;
  final String imageaddress;
  final double bodyTemperature;
  final int heartRate;
  final double weight;
  final int respiratoryRate;
  final String status;

  IndividualAnimalHealth({
    required this.animalId,
    required this.imageaddress,
    required this.bodyTemperature,
    required this.heartRate,
    required this.weight,
    required this.respiratoryRate,
    required this.status
  });

  @override
  _IndividualAnimalHealthState createState() => _IndividualAnimalHealthState();
}

class _IndividualAnimalHealthState extends State<IndividualAnimalHealth> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(widget.imageaddress),
        ),
        title: Text('Animal ID: ${widget.animalId}', style:const  TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15,),
            Text('Body Temperature: ${widget.bodyTemperature}', style: TextStyle(fontSize: 16, color: black),),
            const SizedBox(height: 10,),
            Text('Heart Rate: ${widget.heartRate}', style: TextStyle(fontSize: 16, color: black),),
            const SizedBox(height: 10,),
            Text('Weight: ${widget.weight}', style: TextStyle(fontSize: 16, color: black),),
            const SizedBox(height: 10,),
            Text('Respiratory Rate: ${widget.respiratoryRate}', style: TextStyle(fontSize: 16, color: black),),
            Row(
              children: [
                const Text('Health status:  ', style:  TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),),
                Text(widget.status, style: const TextStyle(fontSize: 16, color: Colors.green, fontWeight: FontWeight.w600),),
              ],
            )
          ],
        ),
        trailing: SizedBox(
          width: 80,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                IconButton(onPressed: (){}, splashColor: Colors.green[200], icon: const Icon(Icons.edit, color: Colors.green,)),
                 IconButton(onPressed: (){}, splashColor: Colors.red[100], icon: const Icon(Icons.delete, color: Colors.red,)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}