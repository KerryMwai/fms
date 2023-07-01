import 'package:flutter/material.dart';
import 'package:fms/pages/livestock/breeding/breedig-management/animal_fertility_and_reproductive_history.dart';
import 'package:fms/pages/livestock/breeding/breedig-management/weight_analytics.dart';
import 'package:fms/pages/livestock/breeding/breedig-management/weight_management.dart';

class BreedManagement extends StatefulWidget {
  const BreedManagement({super.key});

  @override
  State<BreedManagement> createState() => _BreedManagementState();
}

class _BreedManagementState extends State<BreedManagement> {
  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
        itemCount: 3,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
      itemBuilder: (context, index){
        if(index==1){

           return GestureDetector(
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>const AnimalReproductivityAndHistory())),
            child: const Card(
              
            margin: EdgeInsets.all(10),
            color: Colors.grey,
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Center(child: Text("Breed Productivity History")),
            ),
                  ),
          );
        }else if(index==2){

           return GestureDetector(
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>const AnimalWeightManagement())),
            child: const Card(
              
            margin: EdgeInsets.all(10),
            color: Colors.grey,
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Center(child: Text("Weight Management")),
            ),
                  ),
          );
        }else{
            return GestureDetector(
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>AnimalWeightAnalytics())),
            child: const Card(
              
            margin: EdgeInsets.all(10),
            color: Colors.grey,
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Center(child: Text("Weight Analytics")),
            ),
                  ),
          );
        }
      });
  }
}