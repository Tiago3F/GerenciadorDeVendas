// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_client.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateClient on _CreateClientBase, Store {
  late final _$nomeAtom =
      Atom(name: '_CreateClientBase.nome', context: context);

  @override
  String? get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String? value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  late final _$_CreateClientBaseActionController =
      ActionController(name: '_CreateClientBase', context: context);

  @override
  void setNameClient(String name) {
    final _$actionInfo = _$_CreateClientBaseActionController.startAction(
        name: '_CreateClientBase.setNameClient');
    try {
      return super.setNameClient(name);
    } finally {
      _$_CreateClientBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCpfClient(String cpF) {
    final _$actionInfo = _$_CreateClientBaseActionController.startAction(
        name: '_CreateClientBase.setCpfClient');
    try {
      return super.setCpfClient(cpF);
    } finally {
      _$_CreateClientBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLimitClient(String limit) {
    final _$actionInfo = _$_CreateClientBaseActionController.startAction(
        name: '_CreateClientBase.setLimitClient');
    try {
      return super.setLimitClient(limit);
    } finally {
      _$_CreateClientBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCtnCorentClient(String cntCorrente) {
    final _$actionInfo = _$_CreateClientBaseActionController.startAction(
        name: '_CreateClientBase.setCtnCorentClient');
    try {
      return super.setCtnCorentClient(cntCorrente);
    } finally {
      _$_CreateClientBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nome: ${nome}
    ''';
  }
}
