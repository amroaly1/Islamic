import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/core/model/radio_model.dart';
import 'package:islami_app/core/repository/api_respository.dart';
import 'package:islami_app/features/radio/manager/cubit/radio_state.dart';

class RadioCubit extends Cubit<RadioState> {
  final ApiRespository _apiRespository;
  RadioCubit(this._apiRespository) : super(RadioInitial());
  List<RadioModel> radio = [];

  void inital() async {
    emit(RadioGetDataLoading());
    final response = await _apiRespository.getRadios();
    response.fold(
      (errorMessage) => emit(
        RadioGetDataFailure(message: errorMessage.errorMessage),
      ),
      (data) {
        radio = data;

        emit(RadioGetDataSuccess());
      },
    );
  }
}
