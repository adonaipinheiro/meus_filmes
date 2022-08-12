import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meus_filmes/main/factories/pages/splash_presenter_factory.dart';
import 'package:meus_filmes/presentation/splash/splash_presenter.dart';
import 'package:meus_filmes/ui/splash/splash_screen.dart';

Widget makeSplashScreen() {
  Get.put<SplashPresenter>(makeSplashPresenter());
  return const SplashScreen();
}
