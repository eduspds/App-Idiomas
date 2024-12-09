import 'package:firebase_auth/firebase_auth.dart';

abstract class GoogleAuthState {}
class GoogleAuthInitialState extends GoogleAuthState {}

class GoogleAuthLoadingState extends GoogleAuthState {}

class GoogleAuthSuccessState extends GoogleAuthState { 
  final User user;
  GoogleAuthSuccessState(this.user);
}

class GoogleAuthFaliedState extends GoogleAuthState{
  final String error;

  GoogleAuthFaliedState(this.error);
}
