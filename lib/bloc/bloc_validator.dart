import 'dart:async';

class ValidatorMixin {

  final emailValidator = StreamTransformer.fromHandlers(
    handleData: (email, sink){
      if (email.contains('@')){
        sink.add('');
      } else {
        sink.add("Invalid email");
      }
    }
  );

  final passwordValidator = StreamTransformer.fromHandlers(
    handleData: (password, sink){
      if (password.length < 5){
        sink.add('');
      } else {
        sink.add("Invalid password");
      }
    }
  );
}