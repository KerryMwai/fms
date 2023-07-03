import 'package:flutter/material.dart';
import 'package:fms/controller/model/animal_fertility_and_reproductive_history_model.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/pages/livestock/breeding/breedig-management/animal_fertility_and_reproductive_history.dart';
import 'package:fms/repository/livestock_repository.dart';
import 'package:fms/widgets/feed_widgets/custom_form_field.dart';

class EditBreed extends StatefulWidget {
  final String id;
  final FertilityAndReproductiveHistoryModel breed;
  const EditBreed({super.key, required this.id, required this.breed});

  @override
  State<EditBreed> createState() => _EditBreedState();
}

class _EditBreedState extends State<EditBreed> {
  final animalid = TextEditingController();
  final animalbreed = TextEditingController();
  DateTime? acquisitiondate;
  final breedattempts = TextEditingController();
  final breedingsuccess = TextEditingController();
  final reproductivecycle = TextEditingController();
  final heat = TextEditingController();
  DateTime? conceptiondate;
  final gestationperiod = TextEditingController();
  final reproductivehealth = TextEditingController();
  final breedingperformance = TextEditingController();
  final interventions = TextEditingController();
  final breedingprogram= TextEditingController();
  final observation = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    animalid.text=widget.breed.animalid;
    animalbreed.text=widget.breed.animalbreed;
    breedattempts.text=widget.breed.breedingattempt.toString();
    breedingsuccess.text=widget.breed.breedingsuccess.toString();
    reproductivecycle.text=widget.breed.reproductivecycle;
    heat.text=widget.breed.estrusbehaviour;
    gestationperiod.text=widget.breed.gestationperiod.toString();
    reproductivehealth.text=widget.breed.reproductivehealth;
    breedingperformance.text=widget.breed.breedingperformance.toString();
    interventions.text=widget.breed.reproductiveinterventions;
    breedingprogram.text=widget.breed.breedingprogram;
    observation.text=widget.breed.observations;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueGrey,
        title: const Text("Update Breed Information"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              FeedFormField(
                  controller: animalid,
                  labelText: "Breed id",
                  valitationText: "Breed id is required"),
              FeedFormField(
                  controller: animalbreed,
                  labelText: "Breed name",
                  valitationText: "Breed name is required"),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2010),
                      lastDate: DateTime(2040),
                    );
                    setState(() {
                      acquisitiondate = picked??widget.breed.birthdate;
                    });
                  },
                  readOnly: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Acquisition date',
                  ),
                  validator: (value) {
                    // ignore: unnecessary_null_comparison
                    if (acquisitiondate == null) {
                      return 'Breed acquisition date';
                    }
                    return null;
                  },
                  controller: TextEditingController(
                    // ignore: unnecessary_null_comparison
                    text: acquisitiondate != null
                        ? acquisitiondate.toString().split(' ')[0]
                        : '',
                  ),
                ),
              ),

              const SizedBox(height: 15,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2010),
                      lastDate: DateTime(2040),
                    );
                    setState(() {
                      conceptiondate = picked?? widget.breed.conceptiondate;
                    });
                  },
                  readOnly: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Conception date',
                  ),
                  validator: (value) {
                    // ignore: unnecessary_null_comparison
                    if (conceptiondate == null) {
                      return 'Conception date';
                    }
                    return null;
                  },
                  controller: TextEditingController(
                    // ignore: unnecessary_null_comparison
                    text: conceptiondate != null
                        ? conceptiondate.toString().split(' ')[0]
                        : '',
                  ),
                ),
              ),
              FeedFormField2(
                  controller: breedattempts,
                  labelText: "Breeding attempts",
                  valitationText: "Breeding attempts is required"),
              FeedFormField2(
                  controller: breedingsuccess,
                  labelText: "Breeding success",
                  valitationText: "Breeding success is required"),
              FeedFormField(
                  controller: reproductivecycle,
                  labelText: "Breed reproductive cycle",
                  valitationText: "Breed reproductive cycle is required"),
              FeedFormField(
                  controller: heat,
                  labelText: "Breed mating schedule (how many times a year)",
                  valitationText: "Breed mating schedule is required"),
              FeedFormField2(
                  controller: gestationperiod,
                  labelText: "Breed gestation period in days",
                  valitationText: "Breed gestation period is required"),
              FeedFormField(
                  controller: reproductivehealth,
                  labelText: "Breed reproductive health",
                  valitationText: "Breed reproductive health is required"),
              FeedFormField2(
                  controller: breedingperformance,
                  labelText: "Breed performance as percent",
                  valitationText: "Breed perfomance is required"),
              FeedFormField(
                  controller: interventions,
                  labelText: "Breed reproductive intervention",
                  valitationText:
                      "Breed reproductive intervention is required"),
              FeedFormField(
                  controller: breedingprogram,
                  labelText: "Breeding program",
                  valitationText:
                      "Breeding program is required"),
              FeedFormField(
                  controller: observation,
                  labelText: "Breed observation",
                  valitationText: "Breed observation is required"),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size.width * 0.4,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(green)
                      ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            LivestockRepostory().updateBreedingInformation(widget.id,FertilityAndReproductiveHistoryModel(animalid: animalid.text, animalbreed: animalbreed.text, birthdate: acquisitiondate!, breedingattempt: int.parse(breedattempts.text), breedingsuccess: int.parse(breedingsuccess.text), reproductivecycle: reproductivecycle.text, estrusbehaviour: reproductivecycle.text, conceptiondate: conceptiondate!, gestationperiod: int.parse(gestationperiod.text), reproductivehealth: reproductivehealth.text, breedingperformance:double.parse( breedingperformance.text), reproductiveinterventions: interventions.text, observations: observation.text, breedingprogram: breedingprogram.text, matingschedule: heat.text).toJson()).then((value) => ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text("${widget.breed.animalid} update successfully")))).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context)=>const AnimalReproductivityAndHistory())));
                          }
                        },
                        child: const Text("Update Breed")),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
