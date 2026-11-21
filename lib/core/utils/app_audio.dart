import 'package:audioplayers/audioplayers.dart';

class AppAudio {
  AppAudio._();
  static final AppAudio _instance = AppAudio._();

  factory AppAudio() {
    return _instance;
  }

  static final player = AudioPlayer();
  static bool isPlayed = false;
}
