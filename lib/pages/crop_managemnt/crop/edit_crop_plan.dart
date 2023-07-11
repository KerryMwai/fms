import 'package:flutter/material.dart';
import 'package:fms/controller/model/crop_plan_model.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/repository/crops_repository.dart';
import 'package:fms/widgets/feed_widgets/custom_form_field.dart';
import 'package:go_router/go_router.dart';

class EditCropPlan extends StatefulWidget {
  final String id;
  final CropPlan plan;
  const EditCropPlan({super.key, required this.id, required this.plan});

  @override
  EditCropPlanState createState() => EditCropPlanState();
}

class EditCropPlanState extends State<EditCropPlan> {
  final _formKey = GlobalKey<FormState>();
  final  selectedCrop=TextEditingController();
  DateTime? selectedPlantingDate;
  final spacing=TextEditingController();
  String? selectedFertilizerType;
  final fertilizername=TextEditingController();
  bool? pestManagementRequired=false;

  List<String> cropOptions = [
    'Maize',
    'Beans',
    'Wheat',
    'Corn',
    'Rice',
    'Soybean',
    'Tomato',
    'Potato',
  ];

  List<String> fertilizerTypes = [
    'Organic',
    'Synthetic',
  ];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {

      CropRepostory().updateCropPlan(widget.id,CropPlan(fertilizername: fertilizername.text, fertilizertype: selectedFertilizerType, plantingDate: selectedPlantingDate, spacing: double.parse(spacing.text), crop: selectedCrop.text, pestManagementRequired: pestManagementRequired!).toJson()).then((value) => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Plan added successfully"))
      )).then((value) =>context.go('/crop-plans'));
      
    }
  }

  @override
  Widget build(BuildContext context) {
    selectedPlantingDate=widget.plan.plantingDate;
    spacing.text=widget.plan.spacing.toString();
    fertilizername.text=widget.plan.fertilizername!;
    selectedCrop.text=widget.plan.crop!;
    selectedFertilizerType=widget.plan.fertilizertype;


    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          context.go('/crop-plans');
        }, icon:const Icon(Icons.arrow_back, color: white,)),
        backgroundColor: blueGrey,
        title:const Text('Create Crop Plan'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [     
                const SizedBox(height: 16),
                const Text(
                  'Planting Information',
                  style: TextStyle(fontSize: 18),
                ),
                 const SizedBox(height: 10),
                FeedFormField(controller: selectedCrop, labelText: "Plant targeted", valitationText: "Plant targeted is required"),
                const SizedBox(height: 10),
                TextFormField(
                  
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(

                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2023),
                      lastDate: DateTime(2040),
                    );
                    setState(() {
                      selectedPlantingDate = picked!;
                    });
                  },
                  readOnly: true,
                  
                  decoration:const InputDecoration(
                    
                    border: OutlineInputBorder(),
                    labelText: 'Planting Date',
                  ),
                  validator: (value) {
                    // ignore: unnecessary_null_comparison
                    if (selectedPlantingDate == null) {
                      return 'Please select a planting date';
                    }
                    return null;
                  },
                  controller: TextEditingController(
                    // ignore: unnecessary_null_comparison
                    text: selectedPlantingDate != null
                        ? selectedPlantingDate.toString().split(' ')[0]
                        : '',
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: spacing,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Spacing (in meters)',
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Fertilizer Information',
                  style: TextStyle(fontSize: 18),
                ),
               
                DropdownButtonFormField<String>(
                  value: selectedFertilizerType,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedFertilizerType = newValue!;
                    });
                  },
                  items: fertilizerTypes.map((String type) {
                    return DropdownMenuItem<String>(
                      value: type,
                      child: Text(type),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Fertilizer Type',
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a fertilizer type';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10,),
                  TextFormField(
                    controller: fertilizername,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Fertilizer name',
                  ),
                ),
                const SizedBox(height: 16),
                CheckboxListTile(
                  title: const Text('Pest Management Required'),
                  value: pestManagementRequired,
                  onChanged: (value) {
                    setState(() {
                      pestManagementRequired = value!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                const SizedBox(height: 32),
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(blueGrey)),
                    onPressed: _submitForm,
                    child:  Padding(
                      padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.2, vertical: 12),
                      child:  const Text('Create Plan', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
