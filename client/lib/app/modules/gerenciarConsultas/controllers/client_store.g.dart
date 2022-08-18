// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ClientStore on _ClientStoreBase, Store {
  late final _$clientModelAtom =
      Atom(name: '_ClientStoreBase.clientModel', context: context);

  @override
  ClientModel get clientModel {
    _$clientModelAtom.reportRead();
    return super.clientModel;
  }

  @override
  set clientModel(ClientModel value) {
    _$clientModelAtom.reportWrite(value, super.clientModel, () {
      super.clientModel = value;
    });
  }

  late final _$dataListAtom =
      Atom(name: '_ClientStoreBase.dataList', context: context);

  @override
  ObservableFuture<List<ClientModel>> get dataList {
    _$dataListAtom.reportRead();
    return super.dataList;
  }

  @override
  set dataList(ObservableFuture<List<ClientModel>> value) {
    _$dataListAtom.reportWrite(value, super.dataList, () {
      super.dataList = value;
    });
  }

  late final _$_ClientStoreBaseActionController =
      ActionController(name: '_ClientStoreBase', context: context);

  @override
  dynamic listarPerfis() {
    final _$actionInfo = _$_ClientStoreBaseActionController.startAction(
        name: '_ClientStoreBase.listarPerfis');
    try {
      return super.listarPerfis();
    } finally {
      _$_ClientStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
clientModel: ${clientModel},
dataList: ${dataList}
    ''';
  }
}
