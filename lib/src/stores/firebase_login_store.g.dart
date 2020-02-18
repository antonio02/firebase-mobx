// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FirebaseLoginStore on FirebaseLoginBase, Store {
  final _$signedInAtom = Atom(name: 'FirebaseLoginBase.signedIn');

  @override
  bool get signedIn {
    _$signedInAtom.context.enforceReadPolicy(_$signedInAtom);
    _$signedInAtom.reportObserved();
    return super.signedIn;
  }

  @override
  set signedIn(bool value) {
    _$signedInAtom.context.conditionallyRunInAction(() {
      super.signedIn = value;
      _$signedInAtom.reportChanged();
    }, _$signedInAtom, name: '${_$signedInAtom.name}_set');
  }

  final _$currentUserAtom = Atom(name: 'FirebaseLoginBase.currentUser');

  @override
  FirebaseUser get currentUser {
    _$currentUserAtom.context.enforceReadPolicy(_$currentUserAtom);
    _$currentUserAtom.reportObserved();
    return super.currentUser;
  }

  @override
  set currentUser(FirebaseUser value) {
    _$currentUserAtom.context.conditionallyRunInAction(() {
      super.currentUser = value;
      _$currentUserAtom.reportChanged();
    }, _$currentUserAtom, name: '${_$currentUserAtom.name}_set');
  }

  final _$signInWithGoogleAsyncAction = AsyncAction('signInWithGoogle');

  @override
  Future<void> signInWithGoogle() {
    return _$signInWithGoogleAsyncAction.run(() => super.signInWithGoogle());
  }

  final _$signOutAsyncAction = AsyncAction('signOut');

  @override
  Future<void> signOut() {
    return _$signOutAsyncAction.run(() => super.signOut());
  }

  @override
  String toString() {
    final string =
        'signedIn: ${signedIn.toString()},currentUser: ${currentUser.toString()}';
    return '{$string}';
  }
}
