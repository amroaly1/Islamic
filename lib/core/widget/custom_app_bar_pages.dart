import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_style.dart';

class CustomAppBarPages extends StatelessWidget {
  const CustomAppBarPages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 18),
        Text(
          'إسلامي',
          style: AppStyle.elMessiriBold30,
        ),
      ],
    );
  }
}
