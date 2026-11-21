import 'package:flutter/material.dart';
import 'package:islami_app/core/widget/custom_background_scaffold.dart';
import 'package:islami_app/features/alahdes/model/hadith_model.dart';
import 'package:islami_app/features/alahdes/widget/body_alahdes_details_view.dart';

class AlahdesDetailsView extends StatelessWidget {
  const AlahdesDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    HadithModel hadith =
        ModalRoute.of(context)!.settings.arguments as HadithModel;
    return Scaffold(
      body: CustomBackgroundScaffold(
        child: BodyAlahdesDetailsView(
          hadith: hadith,
        ),
      ),
    );
  }
}
