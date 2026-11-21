import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/core/api/api_consumer.dart';
import 'package:islami_app/core/api/dio_consumer.dart';
import 'package:islami_app/core/repository/api_respository.dart';
import 'package:islami_app/core/widget/custom_background_scaffold.dart';
import 'package:islami_app/core/widget/custom_bottomnavigationbar.dart';
import 'package:islami_app/features/radio/manager/cubit/radio_cubit.dart';
import 'package:islami_app/features/radio/widget/body_radio_view.dart';
import 'package:islami_app/features/radio/widget/custom_no_internet.dart';

class RadioView extends StatelessWidget {
  const RadioView({super.key});

  @override
  Widget build(BuildContext context) {
    final ApiConsumer api = DioConsumer(dio: Dio());
    return PopScope(
      canPop: false,
      child: BlocProvider(
        create: (context) => RadioCubit(ApiRespository(api: api)),
        child: Scaffold(
          bottomNavigationBar: const CustomBottomNavigationBar(
            index: 3,
          ),
          body: CustomBackgroundScaffold(
            child: StreamBuilder<List<ConnectivityResult>>(
                stream: Connectivity().onConnectivityChanged,
                builder: (context,
                    AsyncSnapshot<List<ConnectivityResult>> snapshot) {
                  if (snapshot.hasData) {
                    return CustomScrollView(
                      slivers: [
                        SliverFillRemaining(
                          child: snapshot.data!
                                      .contains(ConnectivityResult.wifi) ||
                                  snapshot.data!
                                      .contains(ConnectivityResult.mobile)
                              ? const BodyRadioView()
                              : const CustomNoInternet(),
                          // child: snapshot.data!.first == ConnectivityResult.none
                          //     ? const Text('No Intermet')
                          //     : const Text('Intermet'),
                        ),
                      ],
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
        ),
      ),
    );
  }
}
