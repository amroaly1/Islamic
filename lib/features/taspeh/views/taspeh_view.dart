import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/core/widget/custom_background_scaffold.dart';
import 'package:islami_app/core/widget/custom_bottomnavigationbar.dart';
import 'package:islami_app/features/taspeh/manager/cubit/taspeh_cubit.dart';
import 'package:islami_app/features/taspeh/widget/body_taspeh_view.dart';

class TaspehView extends StatelessWidget {
  const TaspehView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(
        index: 2,
      ),
      body: BlocProvider(
        create: (context) => TaspehCubit(),
        child: const CustomBackgroundScaffold(
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: BodyTaspehView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
