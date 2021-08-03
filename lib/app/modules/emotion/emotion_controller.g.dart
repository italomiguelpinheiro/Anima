// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emotion_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EmotionController on _EmotionControllerBase, Store {
  final _$valueAtom = Atom(name: '_EmotionControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$addEmotionAsyncAction =
      AsyncAction('_EmotionControllerBase.addEmotion');

  @override
  Future<dynamic> addEmotion(String packageName, EmotionStatus status,
      String timeStamp, String exposedContent, String thoughts) {
    return _$addEmotionAsyncAction.run(() => super
        .addEmotion(packageName, status, timeStamp, exposedContent, thoughts));
  }

  final _$_EmotionControllerBaseActionController =
      ActionController(name: '_EmotionControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_EmotionControllerBaseActionController.startAction(
        name: '_EmotionControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_EmotionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
