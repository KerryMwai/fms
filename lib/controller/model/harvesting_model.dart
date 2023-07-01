class HarvestingModel{
  final String field;
  final String crop;
  final String workforce;
  final String workload;
  final DateTime timefrom;
  final DateTime timeTo;
  final String skills;

  HarvestingModel( {required this.field,  required this.crop,  required this.workforce,  required this.timefrom,  required this.timeTo,  required this.skills,  required this.workload});

  factory HarvestingModel.fromJson(Map<String,dynamic>json){
    return HarvestingModel(field: json['field'], crop: json['crop'], workforce: json['workforce'], timefrom: json['timefrom'], timeTo: json['timeTo'], skills: json['skills'], workload: json['workload']);
  }

  Map<String, dynamic> toJson(){
    return{
      'field':field,
      'crop':crop,
      'workforce':workforce,
      'skills':skills,
      'workload':workload,
      'timefrom':timefrom,
      'timeTo':timeTo,

    };
  }
}