// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perfil_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PerfilStore on _PerfilStoreBase, Store {
  late final _$perfisAtom =
      Atom(name: '_PerfilStoreBase.perfis', context: context);

  @override
  List<dynamic> get perfis {
    _$perfisAtom.reportRead();
    return super.perfis;
  }

  @override
  set perfis(List<dynamic> value) {
    _$perfisAtom.reportWrite(value, super.perfis, () {
      super.perfis = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_PerfilStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$buscarPerfilAsyncAction =
      AsyncAction('_PerfilStoreBase.buscarPerfil', context: context);

  @override
  Future<dynamic> buscarPerfil() {
    return _$buscarPerfilAsyncAction.run(() => super.buscarPerfil());
  }

  @override
  String toString() {
    return '''
perfis: ${perfis},
isLoading: ${isLoading}
    ''';
  }
}
