import 'package:anima/app/shared/models/access_model.dart';
import 'package:anima/app/shared/models/event_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IAccessDatabaseRepository {
  Future<void> addAccess(
      String start, String stop, String packageName, String count);
  CollectionReference<AccessModel> getAccess(String packageName);
}
