import 'package:flutter/material.dart';
import 'package:fms/dammies/constants.dart';
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
    Size size=MediaQuery.of(context).size;
    return  Padding(
      padding: const EdgeInsets.all(15.0),
      child: GridView.builder(
          itemCount: 3,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 20, crossAxisSpacing: 10, childAspectRatio: 2/2.5), 
        itemBuilder: (context, index){
          if(index==1){
    
             return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const AnimalReproductivityAndHistory()));
                      },
                      child: Column(
                        children: [
                          Container(
                            height: size.width * 0.33,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage("asset/images/record.jpg"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Breed Productivity History",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: green),
                          )
                        ],
                      ),
                    );
          }else if(index==2){
    
     return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const AnimalWeightManagement()));
                      },
                      child: Column(
                        children: [
                          Container(
                            height: size.width * 0.33,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage("asset/images/laborm.jpg"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Weight Management",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: green),
                          )
                        ],
                      ),
                    );
          }else{
             return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => AnimalWeightAnalytics()));
                      },
                      child: Column(
                        children: [
                          Container(
                            height: size.width * 0.33,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage("asset/images/level.jpg"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Weight Analytics",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: green),
                          )
                        ],
                      ),
                    );
    
          }
        }),
    );
  }
}