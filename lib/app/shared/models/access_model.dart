import 'package:cloud_firestore/cloud_firestore.dart';

class AccessModel {
  String start;
  String stop;
  String packageName;
  String count;

  AccessModel(
      {required this.start,
      required this.stop,
      required this.packageName,
      required this.count});

  AccessModel.fromJson(Map<String, Object?> json)
      : this(
          start: json['start']! as String,
          stop: json['stop']! as String,
          packageName: json['packageName']! as String,
          count: json['count']! as String,
        );

  Map<String, Object?> toJson() {
    return {
      'start': this.start,
      'stop': this.stop,
      'packageName': this.packageName,
      "count": this.count
    };
  }

  factory AccessModel.fromDocmuents(DocumentSnapshot documentSnapshot) {
    return AccessModel(
        start: documentSnapshot['start'],
        stop: documentSnapshot['stop'],
        packageName: documentSnapshot['packageName'],
        count: documentSnapshot['count']);
  }
}
