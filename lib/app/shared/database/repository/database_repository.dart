
import 'package:anima/app/shared/database/repository/database_repository_interface.dart';
import 'package:anima/app/shared/models/event_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class DatabaseRepository implements IDatabaseRepository{

  final FirebaseFirestore firestore;

  DatabaseRepository(this.firestore);

  @override
  Future<void> addEvent( String eventType, String timeStamp, String packageName, String className) {
    CollectionReference events = firestore.collection('events');
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
  Future<void> addUsage(String packageName, String firstTimeStamp, String lastTimeStamp, String lastTimeUsed, String totalTimeInForeground) {
    CollectionReference usage = FirebaseFirestore.instance.collection('usage');
    return usage
          .add({
            'firstTimeStamp': firstTimeStamp,
            'lastTimeStamp': lastTimeStamp, 
            'packageName': packageName, 
            'lastTimeUsed': lastTimeUsed,
            "totalTimeInForeground": totalTimeInForeground
          })
          .then((value) => print("Usage Added"))
          .catchError((error) => print("Failed to add usage: $error"));
  }

  @override
  Stream<List<EventModel>> getEvents() {
    Stream<QuerySnapshot> _eventsStream = firestore.collection("events").snapshots();
    StreamBuilder<QuerySnapshot>(
        stream: _eventsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        snapshot.data?.docs.map((DocumentSnapshot document) {
          return EventModel.fromDocmuents(document);
        });
        
        throw '';
      },
    );
    throw '';
  }
}