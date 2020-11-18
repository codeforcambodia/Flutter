import 'dart:async';

import 'package:tutorial_flutter/bloc/bloc_validator.dart';

class Bloc extends Object with ValidatorMixin{

  final _email = StreamController<String>();
  final _password = StreamController<String>();

  Stream<String> get getEmail => _email.stream.transform(emailValidator);
  Stream<String> get getPassword => _password.stream.transform(passwordValidator);

  // Getter is an shortcut to access property
  Function(String) get addEmail => _email.sink.add;
  Function(String) get addPassword => _password.sink.add;

}