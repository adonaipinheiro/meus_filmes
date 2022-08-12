import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meus_filmes/main/factories/pages/home_screen_factory.dart';
import 'package:meus_filmes/main/factories/pages/login_screen_factory.dart';
import 'package:meus_filmes/main/factories/pages/signup_screen_factory.dart';
import 'package:meus_filmes/main/factories/pages/splash_screen_factory.dart';
import 'package:meus_filmes/ui/home/home_screen.dart';
import 'package:meus_filmes/ui/login/login_screen.dart';
import 'package:meus_filmes/ui/signup/signup_screen.dart';
import 'package:meus_filmes/ui/splash/splash_screen.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Color(0xff8c59a4)));
  GoogleFonts.config.allowRuntimeFetching = true;
  runApp(const MeusFilmes());
}

class MeusFilmes extends StatelessWidget {
  const MeusFilmes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Melhores Filmes',
      initialRoute: SplashScreen.id,
      getPages: [
        GetPage(name: SplashScreen.id, page: makeSplashScreen),
        GetPage(name: LoginScreen.id, page: makeLoginScreen),
        GetPage(name: SignUpScreen.id, page: makeSignUpScreen),
        GetPage(name: HomeScreen.id, page: makeHomeScreen),
      ],
    );
  }
}
