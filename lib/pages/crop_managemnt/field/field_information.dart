import 'package:flutter/material.dart';
import 'package:fms/dammies/constants.dart';

class FieldInformation {
  final String fieldId;
  final String cropType;
  final DateTime plantingDate;
  final DateTime expectedHarvestDate;
  final String soilType;
  final double pHLevel;
  final double organicMatterContent;
  final Map<String, double> nutrientLevels;
  final List<WeatherCondition> weatherConditions;
  final List<PestDiseaseEvent> pestDiseaseEvents;
  final List<FertilizerApplication> fertilizerApplications;
  final List<IrrigationPractice> irrigationPractices;
  final List<FieldObservation> fieldObservations;
  final List<EquipmentUsage> equipmentUsage;
  final List<YieldRecord> yieldRecords;
  final List<LaborRecord> laborRecords;
  final List<ChemicalApplication> chemicalApplications;
  final List<FieldNote> fieldNotes;

  FieldInformation({required this.fieldId, required this.cropType, required this.plantingDate, required this.expectedHarvestDate, required this.soilType, required this.pHLevel, required this.organicMatterContent, required this.nutrientLevels, required this.weatherConditions, required this.pestDiseaseEvents, required this.fertilizerApplications, required this.irrigationPractices, required this.fieldObservations, required this.equipmentUsage, required this.yieldRecords, required this.laborRecords, required this.chemicalApplications, required this.fieldNotes});
}

class WeatherCondition {
  final DateTime date;
  final double temperature;
  final double precipitation;
  final double humidity;
  final double windSpeed;

  WeatherCondition({required this.date, required this.temperature, required this.precipitation, required this.humidity, required this.windSpeed});
}

class PestDiseaseEvent {
  final String name;
  final double severity;
  final DateTime date;
  final List<PestControlMeasure> controlMeasures;

  PestDiseaseEvent({required this.name, required this.severity, required this.date, required this.controlMeasures});
}

class PestControlMeasure {
  final String name;
  final String description;

  PestControlMeasure({required this.name, required this.description});
}

class FertilizerApplication {
  final String type;
  final double quantity;
  final DateTime applicationDate;

  FertilizerApplication({required this.type, required this.quantity, required this.applicationDate});
}

class IrrigationPractice {
  final String method;
  final double frequency;
  final double duration;

  IrrigationPractice({required this.method, required this.frequency, required this.duration});
}

class FieldObservation {
  final DateTime observationDate;
  final String description;

  FieldObservation({required this.observationDate, required this.description});
}

class EquipmentUsage {
  final String name;
  final DateTime date;
  final String operation;

  EquipmentUsage({required this.name, required this.date, required this.operation});
}

class YieldRecord {
  final DateTime harvestDate;
  final double totalProduction;
  final Map<String, double> areaProduction;

  YieldRecord({required this.harvestDate, required this.totalProduction, required this.areaProduction});
}

class LaborRecord {
  final int numberOfWorkers;
  final double hoursWorked;
  final String tasksPerformed;
  final double laborCost;

  LaborRecord({required this.numberOfWorkers, required this.hoursWorked, required this.tasksPerformed, required this.laborCost});
}

class ChemicalApplication {
  final String type;
  final double applicationRate;
  final DateTime applicationDate;
  final String safetyPrecautions;

  ChemicalApplication({required this.type, required this.applicationRate, required this.applicationDate, required this.safetyPrecautions});
}

class FieldNote {
  final DateTime noteDate;
  final String note;

  FieldNote({required this.noteDate, required this.note});
}


class FieldInformationPage extends StatelessWidget {
  const FieldInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Generate dummy data
    List<FieldInformation> dummyData = generateDummyData(20);

   
      return Scaffold(
        appBar: AppBar(
          backgroundColor: blueGrey,
          title:const Text('Field Information')),
        body: FieldInformationTable(fieldInformation: dummyData),
    );
  }

List<FieldInformation> generateDummyData(int count) {
  List<FieldInformation> data = [];

  for (int i = 0; i < count; i++) {
    FieldInformation field = FieldInformation(
      fieldId: 'Field ${i + 1}',
      cropType: 'Crop ${i + 1}',
      plantingDate: DateTime.now(),
      expectedHarvestDate: DateTime.now().add(Duration(days: 90)),
      soilType: 'Soil Type ${i + 1}',
      pHLevel: 6.5,
      organicMatterContent: 2.3,
      nutrientLevels: {'N': 100.0, 'P': 50.0, 'K': 80.0},
      weatherConditions: [
        WeatherCondition(
          date: DateTime.now(),
          temperature: 25.0,
          precipitation: 10.0,
          humidity: 60.0,
          windSpeed: 15.0,
        ),
      ],
      pestDiseaseEvents: [
        PestDiseaseEvent(
          name: 'Pest Event 1',
          severity: 2.5,
          date: DateTime.now(),
          controlMeasures: [
            PestControlMeasure(
              name: 'Control Measure 1',
              description: 'Description 1',
            ),
          ],
        ),
      ],
      fertilizerApplications: [
        FertilizerApplication(
          type: 'Fertilizer 1',
          quantity: 50.0,
          applicationDate: DateTime.now(),
        ),
      ],
      irrigationPractices: [
        IrrigationPractice(
          method: 'Method 1',
          frequency: 1.5,
          duration: 0.5,
        ),
      ],
      fieldObservations: [
        FieldObservation(
          observationDate: DateTime.now(),
          description: 'Observation 1',
        ),
      ],
      equipmentUsage: [
        EquipmentUsage(
          name: 'Equipment 1',
          date: DateTime.now(),
          operation: 'Operation 1',
        ),
      ],
      yieldRecords: [
        YieldRecord(
          harvestDate: DateTime.now(),
          totalProduction: 100.0,
          areaProduction: {'Area 1': 50.0, 'Area 2': 50.0},
        ),
      ],
      laborRecords: [
        LaborRecord(
          numberOfWorkers: 5,
          hoursWorked: 8.0,
          tasksPerformed: 'Task 1',
          laborCost: 100.0,
        ),
      ],
      chemicalApplications: [
        ChemicalApplication(
          type: 'Chemical 1',
          applicationRate: 2.0,
          applicationDate: DateTime.now(),
          safetyPrecautions: 'Precautions 1',
        ),
      ],
      fieldNotes: [
        FieldNote(
          noteDate: DateTime.now(),
          note: 'Note 1',
        ),
      ],
    );

    data.add(field);
  }

  return data;
}
}



class FieldInformationTable extends StatelessWidget {
  final List<FieldInformation> fieldInformation;

  const FieldInformationTable({super.key, required this.fieldInformation});

  @override
  Widget build(BuildContext context) {
   return DataTable(
     columns: const [
      DataColumn(label: Text('Field ID')),
       DataColumn(label: Text('Crop Type')),
       DataColumn(label: Text('Planting Date')),
       DataColumn(label: Text('Expected Harvest Date')),
       DataColumn(label: Text('Soil Type')),
       DataColumn(label: Text('pH Level')),
       DataColumn(label: Text('Organic Matter Content')),
       DataColumn(label: Text('Nutrient Levels')),
       DataColumn(label: Text('Weather Conditions')),
       DataColumn(label: Text('Pest/Disease Events')),
       DataColumn(label: Text('Fertilizer Applications')),
       DataColumn(label: Text('Irrigation Practices')),
       DataColumn(label: Text('Field Observations')),
       DataColumn(label: Text('Equipment Usage')),
       DataColumn(label: Text('Yield Records')),
       DataColumn(label: Text('Labor Records')),
       DataColumn(label: Text('Chemical Applications')),
       DataColumn(label: Text('Field Notes')),
     ],
     rows:fieldInformation.map((field) {
       return DataRow(cells: [
         DataCell(Text(field.fieldId)),
         DataCell(Text(field.cropType)),
         DataCell(Text(field.plantingDate.toString())),
         DataCell(Text(field.expectedHarvestDate.toString())),
         DataCell(Text(field.soilType)),
         DataCell(Text(field.pHLevel.toString())),
         DataCell(Text(field.organicMatterContent.toString())),
         DataCell(Text(field.nutrientLevels.toString())),
         DataCell(buildListCell(field.weatherConditions)),
         DataCell(buildListCell(field.pestDiseaseEvents)),
         DataCell(buildListCell(field.fertilizerApplications)),
         DataCell(buildListCell(field.irrigationPractices)),
         DataCell(buildListCell(field.fieldObservations)),
         DataCell(buildListCell(field.equipmentUsage)),
         DataCell(buildListCell(field.yieldRecords)),
         DataCell(buildListCell(field.laborRecords)),
         DataCell(buildListCell(field.chemicalApplications)),
         DataCell(buildListCell(field.fieldNotes)),
       ]);
     }).toList(),
   );
  }


    Widget buildListCell(List<dynamic> data) {
    if (data.isNotEmpty) {
      return ListView.builder(
        // shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: BulletText(text: data[index].toString()),
          );
        },
      );
    }
    return const Text('N/A');
  }

  
}



class BulletText extends StatelessWidget {
  final String text;

  const BulletText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       const Padding(
          padding: EdgeInsets.only(right: 4.0),
          child: Icon(Icons.arrow_right),
        ),
        Expanded(child: Text(text)),
      ],
    );
  }
}