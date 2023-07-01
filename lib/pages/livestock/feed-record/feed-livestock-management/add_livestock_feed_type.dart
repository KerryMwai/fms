import 'package:flutter/material.dart';
import 'package:fms/widgets/feed_widgets/custom_form_field.dart';

class AddLiveStockFeedType extends StatefulWidget {
  const AddLiveStockFeedType({super.key});

  @override
  State<AddLiveStockFeedType> createState() => _AddLiveStockFeedTypeState();
}

class _AddLiveStockFeedTypeState extends State<AddLiveStockFeedType> {
  TextEditingController feedname=TextEditingController();
  TextEditingController feedtype=TextEditingController();
  TextEditingController quantity=TextEditingController();
  TextEditingController livestock=TextEditingController();
  TextEditingController livestocknumber=TextEditingController();
  final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Feed"),
        centerTitle: true,
      ),
      body: Padding(padding: const EdgeInsets.all(15), child: Form(
        key: _formKey,
        child: ListView(
          children: [
             FeedFormField(controller: feedname,labelText: "Feed name",valitationText: "Feed name is required"),
             FeedFormField(controller: feedtype,labelText: "Feed type",valitationText: "Feed type is required"),
             FeedFormField(controller: quantity,labelText: "Quantity",valitationText: "Quantity is required"),
             FeedFormField(controller: livestock,labelText: "Livstock type",valitationText: "Livestock type is required"),
             FeedFormField(controller: livestocknumber,labelText: "Livstock population",valitationText: "Livestock population is required"),
           Expanded(child:   Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: size.width*0.4,
                child: ElevatedButton(onPressed: (){
                  if(_formKey.currentState!.validate()){
            
                  }
                }, child:const Text("Add Feed")),)
              ],
             ))
          ],
        ),
      ),),
    );
  }
}