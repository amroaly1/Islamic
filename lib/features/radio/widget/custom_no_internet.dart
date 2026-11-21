import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_color.dart';
import 'package:islami_app/core/utils/app_style.dart';

class CustomNoInternet extends StatelessWidget {
  const CustomNoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.wifi_off,
            size: 150,
            color: AppColor.kPrimaryColor,
          ),
          const SizedBox(height: 10),
          Text(
            'لايوجد اتصال بالانترنت',
            style: AppStyle.elMessiriSemiBold25,
          ),
          const SizedBox(height: 5),
          Text(
            'برجاء الاتصال بالانترنت',
            style: AppStyle.interRegular20,
          ),
        ],
      ),
    );
  }
}
