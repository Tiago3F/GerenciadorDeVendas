// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TableStore on _TableStore, Store {
  Computed<bool>? _$isValidNameComputed;

  @override
  bool get isValidName =>
      (_$isValidNameComputed ??= Computed<bool>(() => super.isValidName,
              name: '_TableStore.isValidName'))
          .value;
  Computed<bool>? _$isValidNameEditarComputed;

  @override
  bool get isValidNameEditar => (_$isValidNameEditarComputed ??= Computed<bool>(
          () => super.isValidNameEditar,
          name: '_TableStore.isValidNameEditar'))
      .value;

  late final _$newNameAtom =
      Atom(name: '_TableStore.newName', context: context);

  @override
  String get newName {
    _$newNameAtom.reportRead();
    return super.newName;
  }

  @override
  set newName(String value) {
    _$newNameAtom.reportWrite(value, super.newName, () {
      super.newName = value;
    });
  }

  late final _$postCreatePerfilAsyncAction =
      AsyncAction('_TableStore.postCreatePerfil', context: context);

  @override
  Future<bool> postCreatePerfil(dynamic nome) {
    return _$postCreatePerfilAsyncAction
        .run(() => super.postCreatePerfil(nome));
  }

  late final _$postEditPerfilAsyncAction =
      AsyncAction('_TableStore.postEditPerfil', context: context);

  @override
  Future<bool> postEditPerfil(dynamic id, dynamic nome) {
    return _$postEditPerfilAsyncAction
        .run(() => super.postEditPerfil(id, nome));
  }

  late final _$postDeletePerfilAsyncAction =
      AsyncAction('_TableStore.postDeletePerfil', context: context);

  @override
  Future<bool> postDeletePerfil(dynamic id) {
    return _$postDeletePerfilAsyncAction.run(() => super.postDeletePerfil(id));
  }

  @override
  String toString() {
    return '''
newName: ${newName},
isValidName: ${isValidName},
isValidNameEditar: ${isValidNameEditar}
    ''';
  }
}
