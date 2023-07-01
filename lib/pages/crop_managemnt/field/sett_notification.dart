import 'package:flutter/material.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/widgets/feed_widgets/custom_form_field.dart';

class SetAlert extends StatefulWidget {
  const SetAlert({super.key});

  @override
  State<SetAlert> createState() => _SetAlertState();
}

class _SetAlertState extends State<SetAlert> {
  final field=TextEditingController();
  final alerttype=TextEditingController();
  final message=TextEditingController();
  final timestamp=TextEditingController();
  final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueGrey,
        title: const Text("Alert Setting"),
        centerTitle: true,
      ),
      body: Padding(padding: const EdgeInsets.all(15), child: Form(
        key: _formKey,
        child: ListView(
          children: [
             FeedFormField(controller: field,labelText: "Field ",valitationText: "Field name is required"),
              FeedFormField(controller: alerttype,labelText: "Alert type",valitationText: "Alert type is required"),
              FeedFormField(controller: message,labelText: "Alert message",valitationText: "Alert message is required"),
              FeedFormField3(controller: timestamp,labelText: "Schedule alert",valitationText: "Alert schedule is required"),
              const SizedBox(height: 30,),
           Expanded(child:   Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: size.width*0.4,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(blueGrey)
                  ),
                  onPressed: (){
                  if(_formKey.currentState!.validate()){
            
                  }
                }, child:const Text("Set Alert")),)
              ],
             ))
          ],
        ),
      ),),
    );
  }
}