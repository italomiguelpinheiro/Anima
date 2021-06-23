import 'package:anima/app/shared/models/emotion_model.dart';
import 'package:anima/app/shared/models/usage_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IEmotionsDatabaseRepository {
  Future<void> addEmotions(String packageName, EmotionStatus emotionStatus,
      String timeStamp, String exposedContent, String thoughts);
  CollectionReference<EmotionModel> getEmotions(String packageName);
}
