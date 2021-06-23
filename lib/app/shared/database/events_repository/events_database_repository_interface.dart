import 'package:anima/app/shared/models/event_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IEventsDatabaseRepository {
  Future<void> addEvent(
      String eventType, String timeStamp, String packageName, String className);
  CollectionReference<EventModel> getEvents();
}
