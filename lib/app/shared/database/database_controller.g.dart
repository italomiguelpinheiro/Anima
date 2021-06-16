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

  final _$_DatabaseControllerBaseActionController =
      ActionController(name: '_DatabaseControllerBase');

  @override
  Stream<List<EventModel>> getEvents() {
    final _$actionInfo = _$_DatabaseControllerBaseActionController.startAction(
        name: '_DatabaseControllerBase.getEvents');
    try {
      return super.getEvents();
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
