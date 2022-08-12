import 'package:get/get.dart';
import 'package:meus_filmes/domain/usecases/signup/register_with_email.dart';
import 'package:meus_filmes/ui/home/home_screen.dart';
import 'package:meus_filmes/ui/login/login_screen.dart';

class SignUpPresenter extends GetxController {
  SignUpPresenter({
    required this.registerWithEmail,
  });

  RegisterWithEmail registerWithEmail;

  RxBool showLoginFailed = false.obs;

  void goToLogin() {
    Get.offAllNamed(LoginScreen.id);
  }

  void onRegisterWithEmail(String email, String pass, String fullName) async {
    var user = await registerWithEmail.execute(
        email: email, fullName: fullName, password: pass);
    if (user != null) {
      Get.offAllNamed(HomeScreen.id);
    } else {
      showLoginFailed.value = true;
    }
  }
}
