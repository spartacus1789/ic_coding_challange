import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthResponse {}

//Complated
class AuthCompleted extends FirebaseAuthResponse with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class AuthFailed extends FirebaseAuthResponse with EquatableMixin {
  final String msg;
  AuthFailed(this.msg) : super();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class AuthCodeSent extends FirebaseAuthResponse with EquatableMixin {
  AuthCodeSent() : super();

  @override
  List<Object?> get props => [];
}

class AuthCodeTimeout extends FirebaseAuthResponse with EquatableMixin {
  AuthCodeTimeout() : super();

  @override
  List<Object?> get props => [];
}
