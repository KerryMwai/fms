class FeedModel{
  final String feedname;
  final String feedtype;
  final double quantityaday;
  final String livestockname;
  final String livestockid;
  final double animalweight;
  final String feedingmethod;
  final DateTime date;

  const FeedModel({required this.feedname, required this.feedtype, required this.quantityaday, required this.livestockname, required this.livestockid, required this.animalweight, required this.feedingmethod, required this.date});

  factory FeedModel.fromJson(Map<String, dynamic> json){
    return FeedModel(feedname: json['feedname'], feedtype: json['feedtype'], quantityaday: json['quantityaday'].toDouble(), livestockname: json['livestockname'], livestockid: json['livestockid'], animalweight: json['animalweight'].toDouble(), feedingmethod: json['feedingmethod'], date: json['date'].toDate());
  }

  Map<String, dynamic> toJson(){
    return {
      'feedname':feedname,
      'feedtype':feedtype,
      'quantityaday':quantityaday,
      'livestockname':livestockname,
      'livestockid':livestockid,
      'animalweight':animalweight,
      'feedingmethod':feedingmethod,
      'date':date
    };
  }
}