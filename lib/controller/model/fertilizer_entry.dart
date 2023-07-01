class FertilizerEntry {
  final String batchNumber;
  final String name;
  final String type;
  final int quantity;
  final String applicationRate;
  final String applicationMethod;
  final String plantTargeted;
  final String seller;
  final int cost;

  FertilizerEntry({
    required this.name,
    required this.type,
    required this.quantity,
    required this.batchNumber,
    required this.applicationRate,
    required this.applicationMethod,
    required this.plantTargeted,
    required this.seller,
    required this.cost,
  });

  factory FertilizerEntry.fromJson(Map<String, dynamic> json){
    return FertilizerEntry(name: json['name'], type: json['type'],  quantity:json['quantity'], batchNumber: json['batchNumber'], applicationRate: json['applicationRate'], applicationMethod:json['applicationMethod'], plantTargeted: json['plantTargeted'], seller: json['seller'], cost: json['cost']);
  }

  Map<String, dynamic> toJson(){
    return {
      "batchNumber":batchNumber,
      "name":name,
      "type":type,
      "quantity":quantity,
      "applicationRate":applicationRate,
      "applicationMethod":applicationMethod,
      "plantTargeted":plantTargeted,
      "seller":seller,
      "cost":cost
    };
  }
}