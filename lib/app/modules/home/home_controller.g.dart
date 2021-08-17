// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$acessoLongoAtom = Atom(name: '_HomeControllerBase.acessoLongo');

  @override
  List<dynamic> get acessoLongo {
    _$acessoLongoAtom.reportRead();
    return super.acessoLongo;
  }

  @override
  set acessoLongo(List<dynamic> value) {
    _$acessoLongoAtom.reportWrite(value, super.acessoLongo, () {
      super.acessoLongo = value;
    });
  }

  final _$acessoCurtoAtom = Atom(name: '_HomeControllerBase.acessoCurto');

  @override
  List<dynamic> get acessoCurto {
    _$acessoCurtoAtom.reportRead();
    return super.acessoCurto;
  }

  @override
  set acessoCurto(List<dynamic> value) {
    _$acessoCurtoAtom.reportWrite(value, super.acessoCurto, () {
      super.acessoCurto = value;
    });
  }

  final _$getAccessAsyncAction = AsyncAction('_HomeControllerBase.getAccess');

  @override
  Future<List<AccessModel>> getAccess(List<EventUsageInfo> eventUsageList) {
    return _$getAccessAsyncAction.run(() => super.getAccess(eventUsageList));
  }

  final _$getEventAsyncAction = AsyncAction('_HomeControllerBase.getEvent');

  @override
  Future<void> getEvent() {
    return _$getEventAsyncAction.run(() => super.getEvent());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  User? getUser() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.getUser');
    try {
      return super.getUser();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addAccess(List<EventUsageInfo> eventUsageList) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.addAccess');
    try {
      return super.addAccess(eventUsageList);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addEvent(List<EventUsageInfo> eventUsageList) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.addEvent');
    try {
      return super.addEvent(eventUsageList);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addUsage(List<UsageInfo> usageInfoList) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.addUsage');
    try {
      return super.addUsage(usageInfoList);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getUsage() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.getUsage');
    try {
      return super.getUsage();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addEmotion() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.addEmotion');
    try {
      return super.addEmotion();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getEmotions() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.getEmotions');
    try {
      return super.getEmotions();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addConfig() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.addConfig');
    try {
      return super.addConfig();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getConfigs() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.getConfigs');
    try {
      return super.getConfigs();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
acessoLongo: ${acessoLongo},
acessoCurto: ${acessoCurto}
    ''';
  }
}
