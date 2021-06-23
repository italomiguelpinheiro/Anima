import 'package:anima/app/shared/auth/auth_controller.dart';
import 'package:anima/app/shared/models/emotion_model.dart';
import 'package:anima/app/shared/models/usage_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'emotions_database_repository_interface.dart';

class EmotionsDatabaseRepository implements IEmotionsDatabaseRepository {
  final FirebaseFirestore firestore;
  final AuthController auth = Modular.get();

  EmotionsDatabaseRepository(this.firestore);

  @override
  Future<void> addEmotions(String packageName, EmotionStatus emotionStatus,
      String timeStamp, String exposedContent, String thoughts) {
    final uid = auth.getCurrentUser()?.uid;
    CollectionReference emotions = firestore
        .collection('users')
        .doc(uid)
        .collection("apps")
        .doc(packageName)
        .collection("emotions");
    return emotions
        .add({
          'emotionStatus': emotionStatus.toShortString(),
          'timeStamp': timeStamp,
          'exposedContent': exposedContent,
          'thoughts': thoughts,
        })
        .then((value) => print("Emotion Added"))
        .catchError((error) => print("Failed to add Emotion: $error"));
  }

  @override
  CollectionReference<EmotionModel> getEmotions(String packageName) {
    final uid = auth.getCurrentUser()?.uid;
    final emotionRef = firestore
        .collection('users')
        .doc(uid)
        .collection("apps")
        .doc(packageName)
        .collection("emotions")
        .withConverter<EmotionModel>(
          fromFirestore: (snapshot, _) =>
              EmotionModel.fromJson(snapshot.data()!),
          toFirestore: (emotionModel, _) => emotionModel.toJson(),
        );
    return emotionRef;
  }
}