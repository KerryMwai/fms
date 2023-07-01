class HarvestPlan{
  final String crop;
  final String method;
  final String season;
  final double quantity;
  final String equipment;
  final String labor;
  final String storage;
  final DateTime?harvestingdate;

  HarvestPlan({required this.crop, required this.method, required this.season, required this.quantity, required this.equipment, required this.labor, required this.storage, required this.harvestingdate});

  factory HarvestPlan.fromJson(Map<String, dynamic>json){
    return HarvestPlan(crop: json['crop'], method: json['method'], season: json['season'], quantity: json['quantity'].toDouble(), equipment: json['equipment'], labor: json['labor'], storage: json['storage'], harvestingdate: json['harvestingdate'].toDate());
  }

  Map<String, dynamic> toJson(){
    return {
      'crop':crop,
      'method':method,
      'season':season,
      'quantity':quantity,
      'equipment':equipment,
      'labor':labor,
      'storage':storage,
      'harvestingdate':harvestingdate
    };
  }
}