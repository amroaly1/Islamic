import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/features/home/manager/cubits/aya_cubit/aya_state.dart';

class AyaCubit extends Cubit<AyaState> {
  AyaCubit() : super(AyaInitial());
  final player = AudioPlayer();
  final ScrollController scrollControllerAya = ScrollController();
  String _baseUrl = '';
  int indexofAya = 1;
  bool playSound = false;

  // void scrollToIndex(int index) {
  //   scrollControllerAya.animateTo(
  //     index * 40.0, // Assuming each list item has a height of 50.0 pixels
  //     duration: const Duration(milliseconds: 300),
  //     curve: Curves.easeInOut,
  //   );
  // }

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  void inital(String indexofSura, int countofAya, List<GlobalKey> keys) {
    indexofAya = 1;
    _baseUrl = 'json/audio/$indexofSura';
    player.onPlayerComplete.listen((event) {
      if (playSound && indexofAya < countofAya) {
        indexofAya += 1;
        scrollToSection(keys[indexofAya - 1]);
        play(formateString(indexofAya));
      } else if (playSound && indexofAya >= countofAya) {
        indexofAya = 1;
        scrollToSection(keys[indexofAya - 1]);
        play(formateString(indexofAya));
      }
    });
  }

  play(String index) async {
    await player.setSource(AssetSource('$_baseUrl/$index.mp3'));
    await player.resume();
    emit(PlayAudio());
  }

  void stop() async {
    await player.stop();
    emit(StopAudio());
  }

  void pause() async {
    await player.pause();
    emit(StopAudio());
  }

  String formateString(int index) {
    if (index >= 1 && index <= 9) {
      return '00$index';
    } else if (index >= 10 && index <= 99) {
      return '0$index';
    }
    return index.toString();
  }
}
