import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:fms/controller/model/crop_growth_model.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/pages/crop_managemnt/crop/crop_growth_pdf.dart';
import 'package:fms/pages/crop_managemnt/crop/edit_crop_growth.dart';
import 'package:fms/pages/crop_managemnt/crop/track_crop_stages.dart';
import 'package:fms/repository/crops_repository.dart';
import 'package:intl/intl.dart';

class CropGrowthRecords extends StatelessWidget {
  final List<Map<String, dynamic>> cropData = [
    {
      'Crop Identification': 'Tomato',
      'Planting Date': DateTime(2023, 1, 10),
      'Phenological Indicator': 'Flowering',
      'Measurements': {
        'Plant Height': 50.0,
        'Leaf Area': 100.0,
      },
      'Environmental Data': {
        'Temperature': 25.0,
        'Humidity': 60.0,
        'Rainfall': 5.0,
        'Sunlight': 'Full',
      },
      'Soil Moisture Levels': 0.5,
    },
    {
      'Crop Identification': 'Corn',
      'Planting Date': DateTime(2023, 2, 5),
      'Phenological Indicator': 'Tasseling',
      'Measurements': {
        'Plant Height': 120.0,
        'Leaf Area': 200.0,
      },
      'Environmental Data': {
        'Temperature': 28.0,
        'Humidity': 55.0,
        'Rainfall': 10.0,
        'Sunlight': 'Partial',
      },
      'Soil Moisture Levels': 0.8,
    },
    {
      'Crop Identification': 'Lettuce',
      'Planting Date': DateTime(2023, 3, 20),
      'Phenological Indicator': 'Harvestable',
      'Measurements': {
        'Plant Height': 30.0,
        'Leaf Area': 80.0,
      },
      'Environmental Data': {
        'Temperature': 20.0,
        'Humidity': 70.0,
        'Rainfall': 3.0,
        'Sunlight': 'Full',
      },
      'Soil Moisture Levels': 0.6,
    },
    {
      'Crop Identification': 'Tomato',
      'Planting Date': DateTime(2023, 1, 10),
      'Phenological Indicator': 'Flowering',
      'Measurements': {
        'Plant Height': 50.0,
        'Leaf Area': 100.0,
      },
      'Environmental Data': {
        'Temperature': 25.0,
        'Humidity': 60.0,
        'Rainfall': 5.0,
        'Sunlight': 'Full',
      },
      'Soil Moisture Levels': 0.5,
    },
    {
      'Crop Identification': 'Corn',
      'Planting Date': DateTime(2023, 2, 5),
      'Phenological Indicator': 'Tasseling',
      'Measurements': {
        'Plant Height': 120.0,
        'Leaf Area': 200.0,
      },
      'Environmental Data': {
        'Temperature': 28.0,
        'Humidity': 55.0,
        'Rainfall': 10.0,
        'Sunlight': 'Partial',
      },
      'Soil Moisture Levels': 0.8,
    },
    {
      'Crop Identification': 'Lettuce',
      'Planting Date': DateTime(2023, 3, 20),
      'Phenological Indicator': 'Harvestable',
      'Measurements': {
        'Plant Height': 30.0,
        'Leaf Area': 80.0,
      },
      'Environmental Data': {
        'Temperature': 20.0,
        'Humidity': 70.0,
        'Rainfall': 3.0,
        'Sunlight': 'Full',
      },
      'Soil Moisture Levels': 0.6,
    },
    {
      'Crop Identification': 'Wheat',
      'Planting Date': DateTime(2023, 2, 15),
      'Phenological Indicator': 'Heading',
      'Measurements': {
        'Plant Height': 90.0,
        'Leaf Area': 150.0,
      },
      'Environmental Data': {
        'Temperature': 22.0,
        'Humidity': 45.0,
        'Rainfall': 8.0,
        'Sunlight': 'Full',
      },
      'Soil Moisture Levels': 0.7,
    },
    {
      'Crop Identification': 'Potato',
      'Planting Date': DateTime(2023, 3, 5),
      'Phenological Indicator': 'Tubering',
      'Measurements': {
        'Plant Height': 70.0,
        'Leaf Area': 120.0,
      },
      'Environmental Data': {
        'Temperature': 23.0,
        'Humidity': 50.0,
        'Rainfall': 7.0,
        'Sunlight': 'Partial',
      },
      'Soil Moisture Levels': 0.6,
    },
    {
      'Crop Identification': 'Rice',
      'Planting Date': DateTime(2023, 4, 1),
      'Phenological Indicator': 'Grain Filling',
      'Measurements': {
        'Plant Height': 100.0,
        'Leaf Area': 180.0,
      },
      'Environmental Data': {
        'Temperature': 30.0,
        'Humidity': 80.0,
        'Rainfall': 15.0,
        'Sunlight': 'Full',
      },
      'Soil Moisture Levels': 0.8,
    },
    {
      'Crop Identification': 'Soybean',
      'Planting Date': DateTime(2023, 4, 10),
      'Phenological Indicator': 'Pod Filling',
      'Measurements': {
        'Plant Height': 80.0,
        'Leaf Area': 140.0,
      },
      'Environmental Data': {
        'Temperature': 27.0,
        'Humidity': 65.0,
        'Rainfall': 12.0,
        'Sunlight': 'Full',
      },
      'Soil Moisture Levels': 0.7,
    },
    {
      'Crop Identification': 'Cabbage',
      'Planting Date': DateTime(2023, 5, 1),
      'Phenological Indicator': 'Heading',
      'Measurements': {
        'Plant Height': 40.0,
        'Leaf Area': 90.0,
      },
      'Environmental Data': {
        'Temperature': 18.0,
        'Humidity': 60.0,
        'Rainfall': 5.0,
        'Sunlight': 'Partial',
      },
      'Soil Moisture Levels': 0.5,
    },
    {
      'Crop Identification': 'Carrot',
      'Planting Date': DateTime(2023, 6, 10),
      'Phenological Indicator': 'Root Development',
      'Measurements': {
        'Plant Height': 50.0,
        'Leaf Area': 70.0,
      },
      'Environmental Data': {
        'Temperature': 20.0,
        'Humidity': 50.0,
        'Rainfall': 6.0,
        'Sunlight': 'Partial',
      },
      'Soil Moisture Levels': 0.6,
    },
    {
      'Crop Identification': 'Pepper',
      'Planting Date': DateTime(2023, 7, 15),
      'Phenological Indicator': 'Fruiting',
      'Measurements': {
        'Plant Height': 60.0,
        'Leaf Area': 110.0,
      },
      'Environmental Data': {
        'Temperature': 25.0,
        'Humidity': 55.0,
        'Rainfall': 8.0,
        'Sunlight': 'Full',
      },
      'Soil Moisture Levels': 0.7,
    },
  ];

  CropGrowthRecords({super.key});

  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueGrey,
        title: const Text('Crop Growth Records'),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: CropRepostory().getAllCropGrowthInforSnapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: green,
                ),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  "An error occured",
                  style: TextStyle(color: red, fontSize: 18),
                ),
              );
            }

            final cropgrowths=snapshot.data!.docs.map((cropgrowth)=>CropGrowthModel.fromJson(cropgrowth.data()! as Map<String, dynamic>)).toList();
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                  width: w*0.5,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(green)
                    ),
                    onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> CropGrowthPdfPreviewPage(cropgrowths: cropgrowths,)));
                  }, child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.picture_as_pdf),
                      SizedBox(width: 6,),
                      Text("Generate Pdf")
                    ],
                  )),
                ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Table(
                        border: TableBorder.all(),
                        defaultColumnWidth: const FixedColumnWidth(150.0),
                        children: [
                          const TableRow(
                            children: [
                              TableCell(
                                child: Center(
                                  child: Text(
                                    'Crop Identification',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Center(
                                  child: Text(
                                    'Planting Date',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Center(
                                  child: Text(
                                    'Phenological Indicator',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Center(
                                  child: Text(
                                    'Measurements',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Center(
                                  child: Text(
                                    'Environmental Data',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Center(
                                  child: Text(
                                    'Soil Moisture Levels',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Center(
                                  child: Text(
                                    'Action',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ...snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            final data =
                                document.data() as Map<String, dynamic>;
                            return TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(data['crop'] ?? ''),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(DateFormat('dd-MM-yy').format(
                                          data['plantingdate'].toDate())),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Center(
                                    child: Text(data['phenologicalindicator']),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                            'Plant Height: ${data['measurement']['plant-height']}'),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        EasyRichText(
                                          'Leaf Area: ${data['measurement']['leaf-area'] ?? ''} cm 2',
                                          patternList: [
                                            EasyRichTextPattern(
                                                targetString: "2",
                                                superScript: true,
                                                style: const TextStyle(
                                                    fontSize: 16)),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        EasyRichText(
                                          'Temperature: ${data['environmental-data']['temperature'] ?? ''}  o C',
                                          patternList: [
                                            EasyRichTextPattern(
                                                targetString: "o",
                                                superScript: true,
                                                style: const TextStyle(
                                                    fontSize: 16)),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                            'Humidity: ${data['environmental-data']['humidity'] ?? ''} mm'),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                            'Rainfall:  ${data['environmental-data']['rainfall'] ?? ''} mm'),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                            'Sunlight:  ${data['environmental-data']['sunlight'] ?? ''}'),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Center(
                                    child: Text("${data['soil-moisture']} mm"),
                                  ),
                                ),
                                TableCell(
                                  child: Center(
                                      child: Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        EditCropTracking(
                                                          id: document.id,
                                                          data: data,
                                                        )));
                                          },
                                          icon: Icon(
                                            Icons.edit,
                                            color: green,
                                          )),
                                      IconButton(
                                          onPressed: () {
                                            showVewDialogCard(data, context);
                                          },
                                          icon: Icon(
                                            Icons.remove_red_eye_outlined,
                                            color: grey,
                                          )),
                                      IconButton(
                                          onPressed: () {
                                            showAlertForDeletion(document.id,
                                                data['crop'], context);
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: red,
                                          )),
                                    ],
                                  )),
                                ),
                              ],
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CropTracking()));
        },
        backgroundColor: blueGrey,
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> showVewDialogCard(crop, context) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("${crop['crop']}"),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Crop: ${crop['crop']}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                ListTile(
                  title: Text(
                    'Planting date',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(DateFormat('dd-MM-yy').format(
                    crop['plantingdate'].toDate(),
                  )),
                ),
                ListTile(
                  title: Text(
                    'Phenological indicator',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    "${crop['phenologicalindicator']}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Measurement',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                          'Plant Height: ${crop['measurement']['plant-height']} cm'),
                      const SizedBox(
                        height: 5,
                      ),
                      EasyRichText(
                        'Leaf Area: ${crop['measurement']['leaf-area'] ?? ''} cm 2',
                        patternList: [
                          EasyRichTextPattern(
                              targetString: "2",
                              superScript: true,
                              style: const TextStyle(fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Text(
                    'Environmental data',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      EasyRichText(
                        'Temperature: ${crop['environmental-data']['temperature'] ?? ''}  o C',
                        patternList: [
                          EasyRichTextPattern(
                              targetString: "o",
                              superScript: true,
                              style: const TextStyle(fontSize: 16)),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Humidity: ${crop['environmental-data']['humidity'] ?? ''} RH',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Rainfall: ${crop['environmental-data']['rainfall'] ?? ''} mm',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Sunlight: ${crop['environmental-data']['sunlight'] ?? ''}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Text(
                    'Moisture level',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    "${crop['soil-moisture']} mm",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Ok")),
            const SizedBox(
              width: 10,
            ),
          ],
        );
      },
    );
  }

  Future<void> showAlertForDeletion(id, crop, context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text("Are you sure you want to delete $crop"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("No")),
            const SizedBox(
              width: 10,
            ),
            TextButton(
                onPressed: () {
                  CropRepostory()
                      .deleteCropGrowthInfor(id)
                      .then((value) => Navigator.pop(context))
                      .then((value) => ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(
                              content: Text("$crop deleted suuccessfully"))));
                },
                child: const Text("Yes"))
          ],
        );
      },
    );
  }
}
