import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/core/model/radio_model.dart';
import 'package:islami_app/core/utils/app_audio.dart';
import 'package:islami_app/features/radio/manager/cubit/audioradio_state.dart';

class AudioradioCubit extends Cubit<AudioradioState> {
  final List<RadioModel> radio;
  AudioradioCubit(this.radio) : super(AudioradioInitial()) {
    seturlaudio();
  }
  int index = 0;
  //final player = AppAudio.player;
  // bool isPlay = AppAudio.isPlayed;
  void seturlaudio() async {
    await AppAudio.player.setSourceUrl(radio[index].url);
  }

  void nextaudio() {
    if (radio.length - 1 == index) {
      index = 0;
    } else {
      index++;
      emit(ChangeRadio());
    }
    seturlaudio();

    if (AppAudio.isPlayed) {
      playAudio();
    }
  }

  void prevaudio() {
    if (index != 0) {
      index--;
      seturlaudio();
      emit(ChangeRadio());
    }
    if (AppAudio.isPlayed) {
      playAudio();
    }
  }

  void playAudio() async {
    AppAudio.isPlayed = true;
    await AppAudio.player.resume();
    emit(PlayAudio());
  }

  void pause() async {
    AppAudio.isPlayed = false;
    await AppAudio.player.pause();
    emit(StopAudio());
  }
}
