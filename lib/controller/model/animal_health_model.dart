class AnimalHealthModel{
  final String animalid;
  final String imageaddress;
  final double bodytemperature;
  final int heartrate;
  final double weight;
  final int respiratoryrate;
  final String status;

  AnimalHealthModel({required this.animalid, required this.imageaddress, required this.bodytemperature, required this.heartrate, required this.weight, required this.respiratoryrate, required this.status});

  factory AnimalHealthModel.fromJson(Map<String, dynamic> json){
    return AnimalHealthModel(animalid: json['animalid'], imageaddress: json['imageaddress'], bodytemperature: json['bodytemperature'].toDouble, heartrate: json['heartrate'].toInt(), weight: json['weight'].toDouble(), respiratoryrate: json['respiratoryrate'].toInt(), status: json['status']);
  }

  Map<String, dynamic> toJson(){
    return{
      'animalid':animalid,
      'imageaddress':imageaddress,
      'bodytemperature':bodytemperature,
      'heartrate':heartrate,
      'weight':weight,
      'respiratoryrate':respiratoryrate,
      'status':status
    };
  }
  
}