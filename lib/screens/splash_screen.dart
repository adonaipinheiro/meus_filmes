import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meus_filmes/screens/login_screen.dart';
import 'package:meus_filmes/ui/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = '/splash';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _checkUserStatus(BuildContext context) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.pushReplacementNamed(context, HomeScreen.id);
    } else {
      Navigator.pushReplacementNamed(context, LoginScreen.id);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _checkUserStatus(context));
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
