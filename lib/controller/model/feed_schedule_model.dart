
class FeedScheduleModel{
  final String livestockid;
  final String livestocktype;
  final DateTime feedingintervalfrom;
  final DateTime feedingintervalto;
  final String feedname;
  final String feedtype;
  final String feedingmethod;
  final double feedquantity;

  FeedScheduleModel({required this.feedingmethod, required this.livestockid, required this.livestocktype, required this.feedingintervalfrom, required this.feedingintervalto, required this.feedname, required this.feedtype, required this.feedquantity});

  factory FeedScheduleModel.fromJson(Map<String, dynamic> json){
    return FeedScheduleModel(feedingmethod: json['feedingmethod'], livestockid: json['livestockid'], livestocktype: json['livestocktype'], feedingintervalfrom: json['feedingintervalfrom'].toDate(), feedingintervalto: json['feedingintervalto'].toDate(), feedname: json['feedname'], feedtype: json['feedtype'], feedquantity: json['feedquantity'].toDouble());
  }


  Map<String, dynamic> toJson(){
    return {
      'feedingmethod':feedingmethod,
      'livestockid':livestockid,
      'livestocktype':livestocktype,
      'feedingintervalfrom':feedingintervalfrom,
      'feedingintervalto':feedingintervalto,
      'feedname':feedname,
      'feedtype':feedtype,
      'feedquantity':feedquantity
    };
  }
  
}