// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leitor_placa_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LeitorPlacaController on _LeitorPlacaControllerBase, Store {
  final _$detectedAtom = Atom(name: '_LeitorPlacaControllerBase.detected');

  @override
  bool get detected {
    _$detectedAtom.context.enforceReadPolicy(_$detectedAtom);
    _$detectedAtom.reportObserved();
    return super.detected;
  }

  @override
  set detected(bool value) {
    _$detectedAtom.context.conditionallyRunInAction(() {
      super.detected = value;
      _$detectedAtom.reportChanged();
    }, _$detectedAtom, name: '${_$detectedAtom.name}_set');
  }

  final _$_LeitorPlacaControllerBaseActionController =
      ActionController(name: '_LeitorPlacaControllerBase');

  @override
  void setText(VisionText visionText) {
    final _$actionInfo =
        _$_LeitorPlacaControllerBaseActionController.startAction();
    try {
      return super.setText(visionText);
    } finally {
      _$_LeitorPlacaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'detected: ${detected.toString()}';
    return '{$string}';
  }
}
