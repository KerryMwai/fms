  // {
  //     'id': 1,
  //     'crop': 'Wheat',
  //     'planting_date': DateTime(2023, 5, 15),
  //     'spacing': 0.5,
  //     'fertilizer': {
  //       'type': 'Organic',
  //       'name': 'Organic Fertilizer XYZ',
  //     },
  //   },

class CropPlan{
    final String? crop;
    final DateTime? plantingDate;
    final double? spacing;
    final String? fertilizername;
    final String? fertilizertype;
    final bool pestManagementRequired;
    const CropPlan({required this.pestManagementRequired, required this.fertilizername, required this.fertilizertype, required this.plantingDate, required this.spacing, required this.crop});

    factory CropPlan.fromJson(Map<String, dynamic>json){
      return CropPlan(plantingDate: json['plantingDate'].toDate() , spacing: json['spacing'].toDouble(), fertilizername: json['fertilizer']['fertilizername'], fertilizertype: json['fertilizer']['fertilizertype'], crop: json['crop'],pestManagementRequired: json['pestManagementRequired']);
    }

    Map<String, dynamic> toJson(){
      return {
          "plantingDate":plantingDate,
          "spacing":spacing,
          "fertilizer":{
            "fertilizername":fertilizername,
            "fertilizertype":fertilizertype
          },
          "crop":crop,
          'pestManagementRequired':pestManagementRequired,
          
      };
    }
  }