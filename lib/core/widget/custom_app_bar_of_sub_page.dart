import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_style.dart';

class CustomAppBarOfSubPage extends StatelessWidget {
  const CustomAppBarOfSubPage({
    super.key,
    required this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 10),
        IconButton(
          style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
          onPressed: onPressed,
          icon: const Icon(Icons.arrow_back),
        ),
        Expanded(
          child: Text(
            'إسلامي',
            style: AppStyle.elMessiriBold30,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(width: 50),
      ],
    );
  }
}
