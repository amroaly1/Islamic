import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/core/utils/app_image.dart';
import 'package:islami_app/core/utils/app_style.dart';
import 'package:islami_app/core/widget/custom_app_bar_pages.dart';
import 'package:islami_app/features/radio/manager/cubit/audioradio_cubit.dart';
import 'package:islami_app/features/radio/manager/cubit/radio_cubit.dart';
import 'package:islami_app/features/radio/manager/cubit/radio_state.dart';
import 'package:islami_app/features/radio/widget/audio_radio.dart';

class BodyRadioView extends StatelessWidget {
  const BodyRadioView({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RadioCubit>(context).inital();
    return BlocBuilder<RadioCubit, RadioState>(
      builder: (context, state) {
        if (state is RadioGetDataSuccess) {
          return SafeArea(
            child: Column(
              children: [
                const CustomAppBarPages(),
                const SizedBox(height: 100),
                Image.asset(AppImage.kRadioLogoImage),
                const SizedBox(height: 50),
                BlocProvider(
                  create: (context) => AudioradioCubit(
                    context.read<RadioCubit>().radio,
                  ),
                  child: const AudioRadio(),
                ),
              ],
            ),
          );
        } else if (state is RadioGetDataFailure) {
          return Center(
            child: Text(
              state.message,
              style: AppStyle.interRegular20,
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
