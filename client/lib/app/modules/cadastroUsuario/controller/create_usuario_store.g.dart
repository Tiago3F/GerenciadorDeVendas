// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_usuario_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateUsuario on _CreateUsuarioBase, Store {
  late final _$nomeAtom =
      Atom(name: '_CreateUsuarioBase.nome', context: context);

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

  late final _$_CreateUsuarioBaseActionController =
      ActionController(name: '_CreateUsuarioBase', context: context);

  @override
  void setNameUsuario(String name) {
    final _$actionInfo = _$_CreateUsuarioBaseActionController.startAction(
        name: '_CreateUsuarioBase.setNameUsuario');
    try {
      return super.setNameUsuario(name);
    } finally {
      _$_CreateUsuarioBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmailUsuario(String emaiL) {
    final _$actionInfo = _$_CreateUsuarioBaseActionController.startAction(
        name: '_CreateUsuarioBase.setEmailUsuario');
    try {
      return super.setEmailUsuario(emaiL);
    } finally {
      _$_CreateUsuarioBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenhaUsuario(String password) {
    final _$actionInfo = _$_CreateUsuarioBaseActionController.startAction(
        name: '_CreateUsuarioBase.setSenhaUsuario');
    try {
      return super.setSenhaUsuario(password);
    } finally {
      _$_CreateUsuarioBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nome: ${nome}
    ''';
  }
}
