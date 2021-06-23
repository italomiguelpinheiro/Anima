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

class EmotionsModel {
  EmotionStatus emotionStatus;
  String timeStamp;
  String exposedContent;
  String thoughts;

  EmotionsModel({
    required this.emotionStatus,
    required this.timeStamp,
    required this.exposedContent,
    required this.thoughts,
  });

  EmotionsModel.fromJson(Map<String, Object?> json)
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

  factory EmotionsModel.fromDocmuents(DocumentSnapshot documentSnapshot) {
    return EmotionsModel(
      emotionStatus: documentSnapshot['emotionStatus'],
      timeStamp: documentSnapshot['emotionStatus'],
      exposedContent: documentSnapshot['emotionStatus'],
      thoughts: documentSnapshot['emotionStatus'],
    );
  }
}
