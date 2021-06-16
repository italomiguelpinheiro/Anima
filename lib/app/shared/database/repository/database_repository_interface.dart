import 'package:anima/app/shared/models/event_model.dart';

abstract class IDatabaseRepository{
  Future<void> addEvent(String eventType, String timeStamp, String packageName, String className);
  Future<void> addUsage( String packageName, String firstTimeStamp, String lastTimeStamp, String lastTimeUsed, String totalTimeInForeground); 
  Stream<List<EventModel>> getEvents(); 
}