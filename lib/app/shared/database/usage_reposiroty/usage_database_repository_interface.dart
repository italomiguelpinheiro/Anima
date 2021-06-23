import 'package:anima/app/shared/models/usage_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IUsageDatabaseRepository {
  Future<void> addUsage(
    String packageName,
    String firstTimeStamp,
    String lastTimeStamp,
    String lastTimeUsed,
    String totalTimeInForeground,
  );
  CollectionReference<UsageModel> getUsages(String packageName);
}
