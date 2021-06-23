import 'package:cloud_firestore/cloud_firestore.dart';

class ConfigModel {
  bool nudgets;
  bool emotions;
  bool confrontation;
  bool googleCalendar;
  bool challengesTotalReduction;
  bool challengesDowntimeApp;

  ConfigModel({
    this.nudgets = false,
    this.emotions = false,
    this.confrontation = false,
    this.googleCalendar = false,
    this.challengesTotalReduction = false,
    this.challengesDowntimeApp = false,
  });

  ConfigModel.fromJson(Map<String, Object?> json)
      : this(
          nudgets: json['nudgets']! as bool,
          emotions: json['emotions']! as bool,
          confrontation: json['confrontation']! as bool,
          googleCalendar: json['googleCalendar']! as bool,
          challengesTotalReduction: json['challengesTotalReduction']! as bool,
          challengesDowntimeApp: json['challengesDowntimeApp']! as bool,
        );

  Map<String, Object?> toJson() {
    return {
      'nudgets': this.nudgets,
      'emotions': this.emotions,
      'confrontation': this.confrontation,
      'googleCalendar': this.googleCalendar,
      'challengesTotalReduction': this.challengesTotalReduction,
      'challengesDowntimeApp': this.challengesDowntimeApp,
    };
  }

  factory ConfigModel.fromDocmuents(DocumentSnapshot documentSnapshot) {
    return ConfigModel(
      nudgets: documentSnapshot['nudgets'],
      emotions: documentSnapshot['emotions'],
      confrontation: documentSnapshot['confrontation'],
      googleCalendar: documentSnapshot['googleCalendar'],
      challengesTotalReduction: documentSnapshot['challengesTotalReduction'],
      challengesDowntimeApp: documentSnapshot['challengesDowntimeApp'],
    );
  }
}
