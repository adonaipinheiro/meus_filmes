import 'package:meus_filmes/main/factories/usecases/signup/remote_register_with_email_factory.dart';
import 'package:meus_filmes/presentation/signup/signup_presenter.dart';

SignUpPresenter makeSignUpPresenter() => SignUpPresenter(
      registerWithEmail: makeRemoteRegisterWithEmail(),
    );
