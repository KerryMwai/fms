import 'package:flutter/material.dart';
import 'package:fms/controller/model/harvesting_schedule.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/pages/crop_managemnt/harvesting/harvesting_schedule_information.dart';
import 'package:fms/repository/harvesting_repostory.dart';
import 'package:fms/widgets/feed_widgets/custom_form_field.dart';

class EditHarvestSchedule extends StatefulWidget {
  final String id;
  final HarvestingSchedule schedule;
  const EditHarvestSchedule({super.key, required this.id, required this.schedule});

  @override
  State<EditHarvestSchedule> createState() => _EditHarvestScheduleState();
}

class _EditHarvestScheduleState extends State<EditHarvestSchedule> {
  final cropname=TextEditingController();
  final cropmaturity=TextEditingController();
  final cropvariety=TextEditingController();
  final harvestinfactors=TextEditingController();
  final laborandequipmentavailability=TextEditingController();
  final storage=TextEditingController();
  final planadjustment=TextEditingController();
  final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    cropname.text=widget.schedule.crop;
    cropmaturity.text=widget.schedule.maturitydays.toString();
    cropvariety.text=widget.schedule.variety;
    harvestinfactors.text=widget.schedule.harvestinfactors;
    laborandequipmentavailability.text=widget.schedule.laborandequipmentavailability;
    storage.text=widget.schedule.storage;
    planadjustment.text=widget.schedule.planadjustment;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueGrey,
        title: const Text("Update harvest schedule"),
        centerTitle: true,
      ),
      body: Padding(padding: const EdgeInsets.all(15), child: Form(
        key: _formKey,
        child: ListView(
          children: [
              FeedFormField(controller: cropname,labelText: "Crop name",valitationText: "Crop name is required"),
             FeedFormField(controller: cropmaturity,labelText: "Crop maturity ",valitationText: "Crop maturity is required"),
              FeedFormField(controller: cropvariety,labelText: "Crop variety",valitationText: "Crop variety is required"),
              FeedFormField(controller: harvestinfactors,labelText: "Harvesting factors",valitationText: "Harvesting factors is required"),
               FeedFormField(controller: laborandequipmentavailability,labelText: "Labor availability",valitationText: "Labor availabiilty is required"),
               FeedFormField(controller: planadjustment,labelText: "Plan adjustment",valitationText: "Plan ajaustment required"),
               FeedFormField(controller: storage,labelText: "Storage",valitationText: "Storage is required"),
              const SizedBox(height: 30,),
              const SizedBox(height: 30,),
           Expanded(child:   Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: size.width*0.5,
                child: ElevatedButton(
                  
                  style: ButtonStyle(
                    
                    backgroundColor: MaterialStatePropertyAll(blueGrey),
                    padding:const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 10))
                  ),
                  onPressed: (){
                  if(_formKey.currentState!.validate()){
                      HarvestingRepository().updateHarvestingSchedule(widget.id,HarvestingSchedule(crop: cropname.text, maturitydays: int.parse(cropmaturity.text), variety: cropvariety.text, harvestinfactors: harvestinfactors.text, laborandequipmentavailability: laborandequipmentavailability.text, storage: storage.text, planadjustment: planadjustment.text).toJson()).then((value) =>ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Schedule udated successfully")))).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context)=>const HarvestingScheduleInformation())));
                  }
                }, child:const Text("Update Schedule", style: TextStyle(fontSize: 18),)),)
              ],
             ))
          ],
        ),
      ),),
    );
  }
}