import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meus_filmes/main/factories/pages/home_presenter_factory.dart';
import 'package:meus_filmes/presentation/home/home_presenter.dart';
import 'package:meus_filmes/ui/home/home_screen.dart';

Widget makeHomeScreen() {
  Get.put<HomePresenter>(makeHomePresenter());
  return const HomeScreen();
}
