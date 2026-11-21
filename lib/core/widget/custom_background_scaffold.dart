import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_image.dart';

class CustomBackgroundScaffold extends StatelessWidget {
  const CustomBackgroundScaffold({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            AppImage.kBackgroundImage,
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: child,
    );
  }
}
