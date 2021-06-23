import 'package:anima/app/shared/models/config_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IConfigsDatabaseRepository {
  Future<void> addConfigs(
      bool nudgets,
      bool emotions,
      bool confrontation,
      bool googleCalendar,
      bool challengesTotalReduction,
      bool challengesDowntimeApp);

  CollectionReference<ConfigModel> getConfigs();
}
