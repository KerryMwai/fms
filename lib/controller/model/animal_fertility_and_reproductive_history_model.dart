
class FertilityAndReproductiveHistoryModel {
  final String animalid;
  final String animalbreed;
  final DateTime birthdate;
  final int breedingattempt;
  final int breedingsuccess;
  final String reproductivecycle;
  final String estrusbehaviour;
  final DateTime conceptiondate;
  final int gestationperiod;
  final String reproductivehealth;
  final double breedingperformance;
  final String reproductiveinterventions;
  final String observations;
  final String breedingprogram;
  final String matingschedule;

  FertilityAndReproductiveHistoryModel(
      {required this.animalid,
      required this.animalbreed,
      required this.birthdate,
      required this.breedingattempt,
      required this.breedingsuccess,
      required this.reproductivecycle,
      required this.estrusbehaviour,
      required this.conceptiondate,
      required this.gestationperiod,
      required this.reproductivehealth,
      required this.breedingperformance,
      required this.reproductiveinterventions,
      required this.observations,
      required this.breedingprogram,
      required this.matingschedule});

  factory FertilityAndReproductiveHistoryModel.fromJson(
      Map<String, dynamic> json) {
    return FertilityAndReproductiveHistoryModel(
        animalid: json['animalid'],
        animalbreed: json['animalbreed'],
        birthdate: json['birthdate'].toDate(),
        breedingattempt: json['breedingattempt'].toInt(),
        breedingsuccess: json['breedingsuccess'].toInt(),
        reproductivecycle: json['reproductivecycle'],
        estrusbehaviour: json['estrusbehaviour'],
        conceptiondate: json['conceptiondate'].toDate(),
        gestationperiod: json['gestationperiod'].toInt(),
        reproductivehealth: json['reproductivehealth'],
        breedingperformance: json['breedingperformance'].toDouble(),
        reproductiveinterventions: json['reproductiveinterventions'],
        observations: json['observations'],
        breedingprogram: json['breedingprogram'],
        matingschedule: json['matingschedule']);
  }

  Map<String, dynamic> toJson() {
    return {
      'animalid': animalid,
      'animalbreed': animalbreed,
      'birthdate': birthdate,
      'breedingattempt': breedingattempt,
      'breedingsuccess': breedingsuccess,
      'reproductivecycle': reproductivecycle,
      'estrusbehaviour': estrusbehaviour,
      'conceptiondate': conceptiondate,
      'gestationperiod': gestationperiod,
      'reproductivehealth': reproductivehealth,
      'breedingperformance': breedingperformance,
      'observations': observations,
      'breedingprogram': breedingprogram,
      'matingschedule': matingschedule,
      'reproductiveinterventions':reproductiveinterventions
    };
  }
}
