import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/core/utils/app_audio.dart';
import 'package:islami_app/core/utils/app_color.dart';
import 'package:islami_app/core/utils/app_style.dart';
import 'package:islami_app/features/radio/manager/cubit/audioradio_cubit.dart';
import 'package:islami_app/features/radio/manager/cubit/audioradio_state.dart';

class AudioRadio extends StatelessWidget {
  const AudioRadio({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioradioCubit, AudioradioState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              context
                  .read<AudioradioCubit>()
                  .radio[context.read<AudioradioCubit>().index]
                  .name,
              style: AppStyle.elMessiriSemiBold25,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    context.read<AudioradioCubit>().nextaudio();
                  },
                  icon: const Icon(
                    Icons.skip_next,
                    size: 40,
                    color: AppColor.kPrimaryColor,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (!AppAudio.isPlayed) {
                      context.read<AudioradioCubit>().playAudio();
                    } else {
                      context.read<AudioradioCubit>().pause();
                    }
                  },
                  icon: AppAudio.isPlayed
                      ? const Icon(
                          Icons.pause,
                          size: 60,
                          color: AppColor.kPrimaryColor,
                        )
                      : const Icon(
                          Icons.play_arrow,
                          size: 60,
                          color: AppColor.kPrimaryColor,
                        ),
                ),
                IconButton(
                  onPressed: () {
                    context.read<AudioradioCubit>().prevaudio();
                  },
                  icon: const Icon(
                    Icons.skip_previous,
                    size: 40,
                    color: AppColor.kPrimaryColor,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
