import 'package:flutter/material.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/widgets/feed_widgets/custom_form_field.dart';

class AddBreed extends StatefulWidget {
  const AddBreed({super.key});

  @override
  State<AddBreed> createState() => _AddBreedState();
}

class _AddBreedState extends State<AddBreed> {
  final acquisitiondate=TextEditingController();
  final breedattempts=TextEditingController();
  final breedingsuccess=TextEditingController();
  final reproductivecycle=TextEditingController();
  final heat=TextEditingController();
  final matingschedule=TextEditingController();
  final conceptiondate=TextEditingController();
  final gestationperiod=TextEditingController();
  final reproductivehealth=TextEditingController();
  final breedingperformance=TextEditingController();
  final interventions=TextEditingController();
  final reproductvehistoryofparents=TextEditingController(); 
  final observation=TextEditingController();
  final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueGrey,
        title: const Text("Add  Breed"),
        centerTitle: true,
      ),
      body: Padding(padding: const EdgeInsets.all(15), child: Form(
        key: _formKey,
        child: ListView(
          children: [
             FeedFormField3(controller: acquisitiondate,labelText: "Breeding acquisition date",valitationText: "Breeding acquisition date is required"),
             FeedFormField2(controller: breedattempts,labelText: "Breeding attempts",valitationText: "Breeding attempts is required"),
             FeedFormField2(controller: breedingsuccess,labelText: "Breeding success",valitationText: "Breeding success is required"),
             FeedFormField(controller: reproductivecycle,labelText: "Breed reproductive cycle",valitationText: "Breed reproductive cycle is required"),
             FeedFormField(controller: heat,labelText: "Breed heat",valitationText: "Breed heat is required"),
             FeedFormField(controller: matingschedule,labelText: "Breed mating schedule",valitationText: "Breed mating schedule is required"),
             FeedFormField3(controller: conceptiondate,labelText: "Breeding conception date",valitationText: "Breeding conception date is required"),
             FeedFormField2(controller: gestationperiod,labelText: "Breed gestation period in days",valitationText: "Breed gestation period is required"),
             FeedFormField(controller: reproductivehealth,labelText: "Breed reproductive health",valitationText: "Breed reproductive health is required"),
             FeedFormField2(controller: breedingperformance,labelText: "Breed performance as percent",valitationText: "Breed perfomance is required"),
             FeedFormField(controller: interventions,labelText: "Breed reproductive intervention",valitationText: "Breed reproductive intervention is required"),
              FeedFormField(controller: reproductvehistoryofparents,labelText: "Reproductive history of parents",valitationText: "Reproductive history of parents is required"),
              FeedFormField(controller: observation,labelText: "Breed observation",valitationText: "Breed observation is required"),
            
            
           Expanded(child:   Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: size.width*0.4,
                child: ElevatedButton(onPressed: (){
                  if(_formKey.currentState!.validate()){
            
                  }
                }, child:const Text("Add Breed")),)
              ],
             ))
          ],
        ),
      ),),
    );
  }
}