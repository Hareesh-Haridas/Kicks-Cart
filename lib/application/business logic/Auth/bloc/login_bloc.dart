import 'package:bloc/bloc.dart';


import 'package:meta/meta.dart';


part 'login_event.dart';


part 'login_state.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {

  LoginBloc() : super(LoginLoading()) {

    on<SigninButtonTapped>((event, emit) => {});

  }

}

