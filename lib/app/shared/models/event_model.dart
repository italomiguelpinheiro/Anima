import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  String eventType;
  String timeStamp;
  String packageName;
  String className;

  EventModel(
      {required this.eventType,
      required this.timeStamp,
      required this.packageName,
      required this.className});

  EventModel.fromJson(Map<String, Object?> json)
      : this(
          eventType: json['eventType']! as String,
          timeStamp: json['timeStamp']! as String,
          packageName: json['packageName']! as String,
          className: json['className']! as String,
        );

  Map<String, Object?> toJson() {
    return {
      'eventType': this.eventType,
      'timeStamp': this.timeStamp,
      'packageName': this.packageName,
      "className": this.className
    };
  }

  factory EventModel.fromDocmuents(DocumentSnapshot documentSnapshot) {
    return EventModel(
        eventType: documentSnapshot['eventType'],
        timeStamp: documentSnapshot['timeStamp'],
        packageName: documentSnapshot['packageName'],
        className: documentSnapshot['className']);
  }
}
