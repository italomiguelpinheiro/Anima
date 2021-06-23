import 'package:cloud_firestore/cloud_firestore.dart';

enum EmotionStatus {
  Irritado,
  Alegre,
  Triste,
  Entediado,
  Surpreso,
  Motivado,
  Preocupado,
  Inspirado,
  Assustado,
  Nostalgico,
  Com_Nojo,
  Frustrado
}

class EmotionModel {
  EmotionStatus emotionStatus;
  String timeStamp;
  String exposedContent;
  String thoughts;

  EmotionModel({
    required this.emotionStatus,
    required this.timeStamp,
    required this.exposedContent,
    required this.thoughts,
  });

  EmotionModel.fromJson(Map<String, Object?> json)
      : this(
          emotionStatus: json['emotionStatus']! as EmotionStatus,
          timeStamp: json['timeStamp']! as String,
          exposedContent: json['exposedContent']! as String,
          thoughts: json['thoughts']! as String,
        );

  Map<String, Object?> toJson() {
    return {
      'emotionStatus': this.emotionStatus,
      'timeStamp': this.timeStamp,
      'exposedContent': this.exposedContent,
      'thoughts': this.thoughts,
    };
  }

  factory EmotionModel.fromDocmuents(DocumentSnapshot documentSnapshot) {
    return EmotionModel(
      emotionStatus: documentSnapshot['emotionStatus'],
      timeStamp: documentSnapshot['emotionStatus'],
      exposedContent: documentSnapshot['emotionStatus'],
      thoughts: documentSnapshot['emotionStatus'],
    );
  }
}
