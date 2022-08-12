import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meus_filmes/main/factories/pages/login_presenter_factory.dart';
import 'package:meus_filmes/presentation/login/login_presenter.dart';
import 'package:meus_filmes/ui/login/login_screen.dart';

Widget makeLoginScreen() {
  Get.put<LoginPresenter>(makeLoginPresenter());
  return const LoginScreen();
}
