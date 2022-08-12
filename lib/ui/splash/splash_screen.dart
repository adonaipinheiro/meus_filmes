import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meus_filmes/presentation/splash/splash_presenter.dart';

class SplashScreen extends StatefulWidget {
  static const String id = '/splash';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _checkUserStatus() async {
    final presenter = Get.find<SplashPresenter>();

    presenter.checkUserStatus();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkUserStatus());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("lib/images/logo.png", width: 150),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Melhores Filmes",
                  style: GoogleFonts.dancingScript(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff8c59a4),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
