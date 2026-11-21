import 'package:flutter/material.dart';
import 'package:islami_app/core/widget/custom_background_scaffold.dart';
import 'package:islami_app/core/widget/custom_bottomnavigationbar.dart';
import 'package:islami_app/features/home/widget/body_home_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        index: 0,
      ),
      body: CustomBackgroundScaffold(
        child: BodyHomeView(),
      ),
    );
  }
}
