class HarvestingSchedule{
  final String crop;
  final int maturitydays;
  final String variety;
  final String harvestinfactors;
  final String laborandequipmentavailability;
  final String storage;
  final String planadjustment;

  HarvestingSchedule({required this.crop, required this.maturitydays, required this.variety, required this.harvestinfactors, required this.laborandequipmentavailability, required this.storage, required this.planadjustment});

  factory HarvestingSchedule.fromJson(Map<String,dynamic> json){
    return HarvestingSchedule(crop: json['crop'], maturitydays: json['maturitydays'], variety: json['variety'], harvestinfactors: json['harvestinfactors'], laborandequipmentavailability: json['laborandequipmentavailability'], storage: json['storage'], planadjustment: json['planadjustment']);
  }

Map<String, dynamic> toJson(){
  return {
    'crop':crop,
    'maturitydays':maturitydays,
    'variety':variety,
    'harvestinfactors':harvestinfactors,
    'laborandequipmentavailability':laborandequipmentavailability,
    'storage':storage,
    'planadjustment':planadjustment
  };
}
}