import 'package:flutter/cupertino.dart';

abstract class CheckLoginEvent {}

class CheckLoginInitial extends CheckLoginEvent {}

class CheckLoginLoading extends CheckLoginEvent {}

class CheckLoginFetched extends CheckLoginEvent {
  final bool isLogin;

  CheckLoginFetched({@required this.isLogin});
}
