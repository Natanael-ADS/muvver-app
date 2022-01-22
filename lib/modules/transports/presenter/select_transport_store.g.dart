// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'select_transport_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SelectTransportStore on _SelectTransportStoreBase, Store {
  final _$valueRadioAtom = Atom(name: '_SelectTransportStoreBase.valueRadio');

  @override
  int get valueRadio {
    _$valueRadioAtom.reportRead();
    return super.valueRadio;
  }

  @override
  set valueRadio(int value) {
    _$valueRadioAtom.reportWrite(value, super.valueRadio, () {
      super.valueRadio = value;
    });
  }

  final _$_SelectTransportStoreBaseActionController =
      ActionController(name: '_SelectTransportStoreBase');

  @override
  void setValueRadio(dynamic value) {
    final _$actionInfo = _$_SelectTransportStoreBaseActionController
        .startAction(name: '_SelectTransportStoreBase.setValueRadio');
    try {
      return super.setValueRadio(value);
    } finally {
      _$_SelectTransportStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
valueRadio: ${valueRadio}
    ''';
  }
}
