// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DatabaseController on _DatabaseControllerBase, Store {
  final _$statusAtom = Atom(name: '_DatabaseControllerBase.status');

  @override
  SyncStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(SyncStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$addEventsAsyncAction =
      AsyncAction('_DatabaseControllerBase.addEvents');

  @override
  Future<void> addEvents(List<EventUsageInfo> usageInfoList) {
    return _$addEventsAsyncAction.run(() => super.addEvents(usageInfoList));
  }

  final _$addUsageAsyncAction = AsyncAction('_DatabaseControllerBase.addUsage');

  @override
  Future<void> addUsage(List<UsageInfo> usageInfoList) {
    return _$addUsageAsyncAction.run(() => super.addUsage(usageInfoList));
  }

  final _$addEmotionAsyncAction =
      AsyncAction('_DatabaseControllerBase.addEmotion');

  @override
  Future<void> addEmotion(String packageName, EmotionStatus emotionStatus,
      String timeStamp, String exposedContent, String thoughts) {
    return _$addEmotionAsyncAction.run(() => super.addEmotion(
        packageName, emotionStatus, timeStamp, exposedContent, thoughts));
  }

  final _$addConfigsAsyncAction =
      AsyncAction('_DatabaseControllerBase.addConfigs');

  @override
  Future<void> addConfigs(
      bool nudgets,
      bool emotions,
      bool confrontation,
      bool googleCalendar,
      bool challengesTotalReduction,
      bool challengesDowntimeApp) {
    return _$addConfigsAsyncAction.run(() => super.addConfigs(
        nudgets,
        emotions,
        confrontation,
        googleCalendar,
        challengesTotalReduction,
        challengesDowntimeApp));
  }

  final _$_DatabaseControllerBaseActionController =
      ActionController(name: '_DatabaseControllerBase');

  @override
  CollectionReference<EventModel> getEvents(
      String packageName, String eventType) {
    final _$actionInfo = _$_DatabaseControllerBaseActionController.startAction(
        name: '_DatabaseControllerBase.getEvents');
    try {
      return super.getEvents(packageName, eventType);
    } finally {
      _$_DatabaseControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  CollectionReference<UsageModel> getUsages(String packageName) {
    final _$actionInfo = _$_DatabaseControllerBaseActionController.startAction(
        name: '_DatabaseControllerBase.getUsages');
    try {
      return super.getUsages(packageName);
    } finally {
      _$_DatabaseControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  CollectionReference<EmotionModel> getEmotions(String packageName) {
    final _$actionInfo = _$_DatabaseControllerBaseActionController.startAction(
        name: '_DatabaseControllerBase.getEmotions');
    try {
      return super.getEmotions(packageName);
    } finally {
      _$_DatabaseControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  CollectionReference<ConfigModel> getConfigs() {
    final _$actionInfo = _$_DatabaseControllerBaseActionController.startAction(
        name: '_DatabaseControllerBase.getConfigs');
    try {
      return super.getConfigs();
    } finally {
      _$_DatabaseControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status}
    ''';
  }
}
