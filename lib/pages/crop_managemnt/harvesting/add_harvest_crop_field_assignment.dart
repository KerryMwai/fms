import 'package:flutter/material.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/widgets/feed_widgets/custom_form_field.dart';

class CreateHarvestFieldCropAssignment extends StatefulWidget {
  const CreateHarvestFieldCropAssignment({super.key});

  @override
  State<CreateHarvestFieldCropAssignment> createState() => _CreateHarvestFieldCropAssignmentState();
}

class _CreateHarvestFieldCropAssignmentState extends State<CreateHarvestFieldCropAssignment> {
  final field=TextEditingController();
  final crop=TextEditingController();
  final workforce=TextEditingController();
  final workload=TextEditingController();
  final timeframefrom=TextEditingController();
  final timeframeto=TextEditingController();
  final skills=TextEditingController();
  final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueGrey,
        title: const Text("Create Crop Field Assignment"),
        centerTitle: true,
      ),
      body: Padding(padding: const EdgeInsets.all(15), child: Form(
        key: _formKey,
        child: ListView(
          children: [
              FeedFormField(controller: field,labelText: "Field name",valitationText: "Field name is required"),
             FeedFormField(controller: crop,labelText: "Type of crop ",valitationText: "Crop name is required"),
              FeedFormField(controller: workforce,labelText: "Workforce",valitationText: "Workforce is required"),
              FeedFormField3(controller: timeframefrom,labelText: "Beginning date",valitationText: "Beginning date is required"),
               FeedFormField3(controller: timeframeto,labelText: "Ending date",valitationText: "Ending date is required"),
               FeedFormField(controller: skills,labelText: "Skills",valitationText: "Skills required"),
              const SizedBox(height: 30,),
              const SizedBox(height: 30,),
           Expanded(child:   Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: size.width*0.4,
                child: ElevatedButton(
                  
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(blueGrey),
                    padding:const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 30))
                  ),
                  onPressed: (){
                  if(_formKey.currentState!.validate()){
            
                  }
                }, child:const Text("Create Crop and Field assignment")),)
              ],
             ))
          ],
        ),
      ),),
    );
  }
}