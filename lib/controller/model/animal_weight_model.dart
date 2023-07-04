class AnimalWeightModel{
  final String animalid;
  final DateTime? weightdate;
  final double weight;
  final String weighttype;
  final String remarks;

  AnimalWeightModel({required this.animalid, required this.weightdate, required this.weight, required this.weighttype, required this.remarks});

  factory AnimalWeightModel.fromJson(Map<String, dynamic>json){
    return AnimalWeightModel(animalid: json['animalid'], weightdate: json['weightdate'].toDate(), weight: json['weight'].toDouble(), weighttype: json['weighttype'], remarks: json['remarks']);
  }

  Map<String, dynamic> toJson(){
    return{
        'animalid':animalid,
        'weightdate':weightdate,
        'weight':weight,
        'weighttype':weighttype,
        'remarks':remarks
    };
  }
}