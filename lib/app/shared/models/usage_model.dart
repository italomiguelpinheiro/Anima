import 'package:cloud_firestore/cloud_firestore.dart';

class UsageModel {
  String packageName;
  String firstTimeStamp;
  String lastTimeStamp;
  String lastTimeUsed;
  String totalTimeInForeground;

  UsageModel(
      {required this.firstTimeStamp,
      required this.lastTimeStamp,
      required this.packageName,
      required this.lastTimeUsed,
      required this.totalTimeInForeground});

  UsageModel.fromJson(Map<String, Object?> json)
      : this(
          firstTimeStamp: json['firstTimeStamp']! as String,
          lastTimeStamp: json['lastTimeStamp']! as String,
          packageName: json['packageName']! as String,
          lastTimeUsed: json['lastTimeUsed']! as String,
          totalTimeInForeground: json['totalTimeInForeground']! as String,
        );

  Map<String, Object?> toJson() {
    return {
      'firstTimeStamp': this.firstTimeStamp,
      'lastTimeStamp': this.lastTimeStamp,
      'packageName': this.packageName,
      "lastTimeUsed": this.lastTimeUsed,
      "totalTimeInForeground": this.totalTimeInForeground
    };
  }

  factory UsageModel.fromDocmuents(DocumentSnapshot documentSnapshot) {
    return UsageModel(
        firstTimeStamp: documentSnapshot['firstTimeStamp'],
        lastTimeStamp: documentSnapshot['lastTimeStamp'],
        packageName: documentSnapshot['packageName'],
        lastTimeUsed: documentSnapshot['lastTimeUsed'],
        totalTimeInForeground: documentSnapshot['totalTimeInForeground']);
  }
}
