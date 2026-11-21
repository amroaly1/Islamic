import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/features/home/manager/cubits/aya_cubit/aya_cubit.dart';
import 'package:islami_app/core/widget/custom_background_scaffold.dart';
import 'package:islami_app/features/home/model/sura_name_model.dart';
import 'package:islami_app/features/home/widget/body_sura_view.dart';

class SuraView extends StatelessWidget {
  const SuraView({super.key});

  @override
  Widget build(BuildContext context) {
    final SuraNameModel sura =
        ModalRoute.of(context)!.settings.arguments as SuraNameModel;
    return PopScope(
      canPop: false,
      child: BlocProvider(
        create: (context) => AyaCubit(),
        child: Scaffold(
          body: CustomBackgroundScaffold(
              child: Center(
            child: BodySuraView(
              sura: sura,
            ),
          )),
        ),
      ),
    );
  }
}
