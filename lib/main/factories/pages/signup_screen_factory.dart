import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meus_filmes/main/factories/pages/signup_presenter_factory.dart';
import 'package:meus_filmes/presentation/signup/signup_presenter.dart';
import 'package:meus_filmes/ui/signup/signup_screen.dart';

Widget makeSignUpScreen() {
  Get.put<SignUpPresenter>(makeSignUpPresenter());
  return const SignUpScreen();
}
