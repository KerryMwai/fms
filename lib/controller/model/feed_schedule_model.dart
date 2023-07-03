import 'package:flutter/material.dart';

class FeedScheduleModel{
  final String livestockid;
  final String livestocktype;
  final TimeOfDay feedingintervalfrom;
  final TimeOfDay feedingintervalto;
  final String feedname;
  final String feedtype;
  final double feedquantity;

  FeedScheduleModel({required this.livestockid, required this.livestocktype, required this.feedingintervalfrom, required this.feedingintervalto, required this.feedname, required this.feedtype, required this.feedquantity});

  factory FeedScheduleModel.fromJson(Map<String, dynamic> json){
    return FeedScheduleModel(livestockid: json['livestockid'], livestocktype: json['livestocktype'], feedingintervalfrom: json['feedingintervalfrom'].toDate(), feedingintervalto: json['feedingintervalto'].toDate(), feedname: json['feedname'], feedtype: json['feedtype'], feedquantity: json['feedquantity'].toDouble());
  }


  Map<String, dynamic> toJson(){
    return {
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