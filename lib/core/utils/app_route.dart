import 'package:flutter/material.dart';
import 'package:islami_app/features/alahdes/views/alahdes_details_view.dart';
import 'package:islami_app/features/alahdes/views/alahdes_view.dart';
import 'package:islami_app/features/home/views/home_view.dart';
import 'package:islami_app/features/home/views/sura_view.dart';
import 'package:islami_app/features/radio/views/radio_view.dart';
import 'package:islami_app/features/taspeh/views/taspeh_view.dart';

class AppRoute {
  static Map<String, WidgetBuilder> routes = {
    AppViewsName.kHomeView: (contex) => const HomeView(),
    AppViewsName.kSuraView: (context) => const SuraView(),
    AppViewsName.kAlAhadesView: (context) => const AlahdesView(),
    AppViewsName.kRadioView: (context) => const RadioView(),
    AppViewsName.kTaspehView: (context) => const TaspehView(),
    AppViewsName.kAlAhadesDetailsView: (context) => const AlahdesDetailsView(),
  };
}

class AppViewsName {
  static const kHomeView = '/homepage';
  static const kSuraView = '/suraView';
  static const kAlAhadesView = '/alahadesview';
  static const kRadioView = '/radioview';
  static const kTaspehView = '/taspehview';
  static const kAlAhadesDetailsView = '/alahadesdetailsview';
}
