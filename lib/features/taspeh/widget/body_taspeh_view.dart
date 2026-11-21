import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/core/utils/app_color.dart';
import 'package:islami_app/core/utils/app_image.dart';
import 'package:islami_app/core/utils/app_style.dart';
import 'package:islami_app/core/widget/custom_app_bar_pages.dart';
import 'package:islami_app/features/taspeh/manager/cubit/taspeh_cubit.dart';
import 'package:islami_app/features/taspeh/manager/cubit/taspeh_state.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class BodyTaspehView extends StatelessWidget {
  const BodyTaspehView({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TaspehCubit>(context).inital();
    return SizedBox(
      width: double.infinity,
      child: SafeArea(
        child: Column(
          children: [
            const CustomAppBarPages(),
            const SizedBox(height: 28),
            Image.asset(
              AppImage.kSebhaLogoImage,
              height: 300,
              width: 300,
            ),
            Center(
              child: Text(
                'عدد التسبيحات',
                style: AppStyle.elMessiriSemiBold25,
              ),
            ),
            const SizedBox(height: 20),
            BlocBuilder<TaspehCubit, TaspehState>(
              builder: (context, state) {
                return CircularPercentIndicator(
                  radius: 65,
                  animateFromLastPercent: true, // start from last position
                  animation: true,
                  animationDuration: 500,
                  lineWidth: 10,
                  backgroundColor: Colors.transparent,
                  percent: context.read<TaspehCubit>().numberofTaspeha / 33,
                  progressColor: AppColor.kPrimaryColor,
                  footer: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: InkWell(
                      onTap: () {
                        context.read<TaspehCubit>().taspehaIncrease();
                      },
                      onLongPress: () {
                        context.read<TaspehCubit>().reset();
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 18),
                        decoration: BoxDecoration(
                          color: AppColor.kPrimaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          context.read<TaspehCubit>().currentTaspeh,
                          style: AppStyle.interRegular25,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  center: Text(
                    '${BlocProvider.of<TaspehCubit>(context).numberofTaspeha}/33',
                    style: AppStyle.interRegular25,
                  ),
                );
              },
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
