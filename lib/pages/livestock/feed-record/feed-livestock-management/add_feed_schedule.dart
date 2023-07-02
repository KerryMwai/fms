import 'package:flutter/material.dart';
import 'package:fms/widgets/feed_widgets/custom_form_field.dart';

class FeedingSchedule extends StatefulWidget {
  const FeedingSchedule({super.key});

  @override
  State<FeedingSchedule> createState() => _FeedingScheduleState();
}

class _FeedingScheduleState extends State<FeedingSchedule> {
  TextEditingController livestocktype=TextEditingController();
  TextEditingController feedinginterval=TextEditingController();
  TextEditingController feedtype=TextEditingController();
  TextEditingController feedquantity=TextEditingController();
  final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Schedule feeding"),
        centerTitle: true,
      ),
      body: Padding(padding: const EdgeInsets.all(15), child: Form(
        key: _formKey,
        child: ListView(
          children: [
             FeedFormField(controller: livestocktype,labelText: "Livestock type",valitationText: "Livestock type is required"),
             FeedFormField(controller: feedinginterval,labelText: "Feeding interval",valitationText: "Feeding interval is required"),
             FeedFormField(controller: feedtype,labelText: "Feed type",valitationText: "Feed type is required"),
             FeedFormField(controller: feedquantity,labelText: "Feed quantity",valitationText: "Feed quantity is required"),
           Expanded(child:   Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: size.width*0.4,
                child: ElevatedButton(onPressed: (){
                  if(_formKey.currentState!.validate()){
            
                  }
                }, child:const Text("Add Schedule")),)
              ],
             ))
          ],
        ),
      ),),
    );
  }
}