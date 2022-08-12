import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:meus_filmes/domain/usecases/splash/check_user.dart';
import 'package:meus_filmes/ui/home/home_screen.dart';
import 'package:meus_filmes/ui/login/login_screen.dart';

class SplashPresenter extends GetxController {
  SplashPresenter({
    required this.checkUser,
  });

  CheckUser checkUser;

  void checkUserStatus() {
    User? user = checkUser.execute();

    print(user);

    if (user != null) {
      Get.offAndToNamed(HomeScreen.id);
    } else {
      Get.offAndToNamed(LoginScreen.id);
    }
  }
}
