import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  final DocumentReference reference;
  String eventType; 
  String timeStamp;
  String packageName; 
  String className;

  EventModel({
    required this.reference, 
    required this.eventType, 
    required this.timeStamp, 
    required this.packageName, 
    required this.className
    });

  factory EventModel.fromDocmuents(DocumentSnapshot documentSnapshot){
    return EventModel(
    reference: documentSnapshot.reference,
    eventType: documentSnapshot['eventType'], 
    timeStamp: documentSnapshot['timeStamp'], 
    packageName: documentSnapshot['packageName'], 
    className: documentSnapshot['className']
    );
  }
}