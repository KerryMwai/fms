class CropGrowthModel {
  final String crop;
  final DateTime plantingdate;
  final String phenologicalindicator;
  final double plantheight;
  final double leafarea;
  final double tempereture;
  final double humidity;
  final double rainfall;
  final String sunlight;
  final double soilMoistureLevel;

  const CropGrowthModel(
      {required this.crop,
      required this.plantingdate,
      required this.phenologicalindicator,
      required this.plantheight,
      required this.leafarea,
      required this.tempereture,
      required this.humidity,
      required this.rainfall,
      required this.sunlight,
      required this.soilMoistureLevel});

  factory CropGrowthModel.fromJson(Map<String, dynamic> json) {
    return CropGrowthModel(
        crop: json['crop'],
        plantingdate: json['plantingdate'].toDate(),
        phenologicalindicator: json['phenologicalindicator'],
        plantheight: json["measurement"]['plant-height'].toDouble(),
        leafarea: json["measurement"]['leaf-area'].toDouble(),
        tempereture: json['environmental-data']['temperature'].toDouble(),
        humidity: json['environmental-data']['humidity'].toDouble(),
        rainfall: json['environmental-data']['rainfall'].toDouble(),
        sunlight: json['environmental-data']['sunlight'],
        soilMoistureLevel: json['soil-moisture'].toDouble());
  }

  Map<String, dynamic> toJson() {
    return {
      'crop': crop,
      'plantingdate': plantingdate,
      'phenologicalindicator': phenologicalindicator,
      "measurement": {"plant-height": plantheight, "leaf-area": leafarea},
      "environmental-data": {
        "temperature": tempereture,
        "humidity": humidity,
        "rainfall": rainfall,
        "sunlight": sunlight
      },
      "soil-moisture": soilMoistureLevel
    };
  }
}
