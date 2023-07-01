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
}