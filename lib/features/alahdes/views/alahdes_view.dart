import 'package:flutter/material.dart';
import 'package:islami_app/core/widget/custom_background_scaffold.dart';
import 'package:islami_app/core/widget/custom_bottomnavigationbar.dart';
import 'package:islami_app/features/alahdes/widget/body_alahdes_view.dart';

class AlahdesView extends StatelessWidget {
  const AlahdesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        index: 1,
      ),
      body: CustomBackgroundScaffold(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: BodyAlahdesView(),
            ),
          ],
        ),
      ),
    );
  }
}
