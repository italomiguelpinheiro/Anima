import 'package:anima/app/shared/models/event_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'repository/database_repository_interface.dart';

part 'database_controller.g.dart';


class DatabaseController = _DatabaseControllerBase with _$DatabaseController;


abstract class _DatabaseControllerBase with Store {
  
  final IDatabaseRepository _databaseRepository = Modular.get();

  @observable
  SyncStatus status = SyncStatus.loading;

  @action
  Stream<List<EventModel>> getEvents() {
    return _databaseRepository.getEvents();
  }
}

enum SyncStatus { loading, off, complete }