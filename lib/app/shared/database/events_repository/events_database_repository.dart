import 'package:anima/app/shared/auth/auth_controller.dart';
import 'package:anima/app/shared/models/event_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'events_database_repository_interface.dart';

class EventsDatabaseRepository implements IEventsDatabaseRepository {
  final FirebaseFirestore firestore;
  final AuthController auth = Modular.get();

  EventsDatabaseRepository(this.firestore);

  @override
  Future<void> addEvent(String eventType, String timeStamp, String packageName,
      String className) {
    final uid = auth.getCurrentUser()?.uid;
    CollectionReference events = firestore
        .collection('users')
        .doc(uid)
        .collection("apps")
        .doc(packageName)
        .collection("events")
        .doc(eventType)
        .collection("event");
    return events
        .add({
          'eventType': eventType,
          'timeStamp': timeStamp,
          'packageName': packageName,
          'className': className,
        })
        .then((value) => print("Event Added"))
        .catchError((error) => print("Failed to add event: $error"));
  }

  @override
  CollectionReference<EventModel> getEvents() {
    final uid = auth.getCurrentUser()?.uid;
    final eventRef = firestore
        .collection("users")
        .doc(uid)
        .collection("events")
        .withConverter<EventModel>(
          fromFirestore: (snapshot, _) => EventModel.fromJson(snapshot.data()!),
          toFirestore: (eventModel, _) => eventModel.toJson(),
        );
    return eventRef;
  }
}
