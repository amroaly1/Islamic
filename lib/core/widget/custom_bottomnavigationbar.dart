import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_audio.dart';
import 'package:islami_app/core/utils/app_color.dart';
import 'package:islami_app/core/utils/app_image.dart';
import 'package:islami_app/core/utils/app_route.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      width: double.infinity,
      child: BottomNavigationBar(
        onTap: (value) async {
          if (index == value) {
            return;
          }
          await AppAudio.player.stop();
          AppAudio.isPlayed = false;
          if (value == 0) {
            // ignore: use_build_context_synchronously
            Navigator.pushReplacementNamed(context, AppViewsName.kHomeView);
          } else if (value == 1) {
            // ignore: use_build_context_synchronously
            Navigator.pushReplacementNamed(context, AppViewsName.kAlAhadesView);
          } else if (value == 2) {
            // ignore: use_build_context_synchronously
            Navigator.pushReplacementNamed(context, AppViewsName.kTaspehView);
          } else if (value == 3) {
            // ignore: use_build_context_synchronously
            Navigator.pushReplacementNamed(context, AppViewsName.kRadioView);
          }
        },
        type: BottomNavigationBarType.fixed, // Fixed
        backgroundColor: AppColor.kPrimaryColor,
        selectedItemColor: AppColor.kBlackColor,
        showUnselectedLabels: false,
        currentIndex: index,
        selectedFontSize: 10,
        unselectedFontSize: 0,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              AppImage.kQuranImage,
              height: 40,
            ),
            activeIcon: Image.asset(
              AppImage.kQuranImage,
              color: AppColor.kBlackColor,
              fit: BoxFit.scaleDown,
              height: 40,
            ),
            label: 'القرأن',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppImage.kAhadesImage,
              height: 40,
            ),
            activeIcon: Image.asset(
              AppImage.kAhadesImage,
              color: AppColor.kBlackColor,
              height: 40,
            ),
            label: 'الأحاديث',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppImage.kSebhaImage,
              height: 40,
            ),
            activeIcon: Image.asset(
              AppImage.kSebhaImage,
              color: AppColor.kBlackColor,
              height: 40,
            ),
            label: 'التسبيح',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppImage.kRadioImage,
              height: 40,
            ),
            activeIcon: Image.asset(
              AppImage.kRadioImage,
              color: AppColor.kBlackColor,
              height: 40,
            ),
            label: 'الراديو',
          ),
        ],
      ),
    );
  }
}
