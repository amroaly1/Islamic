import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_color.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColor.kPrimaryColor,
      thickness: 2.5,
      height: 0,
    );
  }
}
