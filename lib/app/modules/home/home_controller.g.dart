// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$prontoAtom = Atom(name: '_HomeControllerBase.pronto');

  @override
  bool get pronto {
    _$prontoAtom.context.enforceReadPolicy(_$prontoAtom);
    _$prontoAtom.reportObserved();
    return super.pronto;
  }

  @override
  set pronto(bool value) {
    _$prontoAtom.context.conditionallyRunInAction(() {
      super.pronto = value;
      _$prontoAtom.reportChanged();
    }, _$prontoAtom, name: '${_$prontoAtom.name}_set');
  }

  final _$loadingAtom = Atom(name: '_HomeControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.context.enforceReadPolicy(_$loadingAtom);
    _$loadingAtom.reportObserved();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.context.conditionallyRunInAction(() {
      super.loading = value;
      _$loadingAtom.reportChanged();
    }, _$loadingAtom, name: '${_$loadingAtom.name}_set');
  }

  @override
  String toString() {
    final string =
        'pronto: ${pronto.toString()},loading: ${loading.toString()}';
    return '{$string}';
  }
}
