
class EquipmentEntry {
  final String serialNumber;
  final String name;
  final String type;
  final String description;
  final String manufacturer;
  final String model;
  final String yearOfManufacture;
  final int purchasePrice;
  final String purchaseDate;
  final String maintenanceSchedule;
  final bool assigned;
  final  String field;

  EquipmentEntry({
    required this.serialNumber,
    required this.name,
    required this.type,
    required this.description,
    required this.manufacturer,
    required this.model,
    required this.yearOfManufacture,
    required this.purchasePrice,
    required this.purchaseDate,
    required this.maintenanceSchedule,
    this.assigned=false,
    this.field="No field"
  });

  factory EquipmentEntry.fromJson(Map<String, dynamic> json){
    return EquipmentEntry(serialNumber: json['serialNumber'], name: json['name'], type:json ['type'], description: json['description'], manufacturer: json['manufacturer'], model: json['model'], yearOfManufacture: json['yearOfManufacture'], purchasePrice: json['purchasePrice'], purchaseDate: json['purchaseDate'], maintenanceSchedule: json['maintenanceSchedule'], assigned: json['assigned'],field: json['field']);
  }

  Map<String, dynamic> toJson(){
    return{
      "serialNumber":serialNumber,
      "name":name,
      "type":type,
      "description":description,
      "manufacturer":manufacturer,
      "model":model,
      "yearOfManufacture":yearOfManufacture,
      "purchasePrice":purchasePrice,
      "purchaseDate":purchaseDate,
      "maintenanceSchedule":maintenanceSchedule,
      "assigned":assigned,
      "field":field
    };
  }
}