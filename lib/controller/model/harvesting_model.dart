class HarvestingModel{
  final String field;
  final String crop;
  final int workforce;
  final String workload;
  final String harvestingmethod;
  final String storage;
  final String harvestingseason;
  final DateTime timefrom;
  final DateTime timeTo;
  final String skills;
  final double quantityestimate;

  HarvestingModel(this.field, this.crop, this.workforce, this.harvestingmethod, this.storage, this.timefrom, this.timeTo, this.skills, this.workload, this.harvestingseason, this.quantityestimate);
}