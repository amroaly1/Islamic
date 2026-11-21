import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/features/taspeh/manager/cubit/taspeh_state.dart';

class TaspehCubit extends Cubit<TaspehState> {
  TaspehCubit() : super(TaspehInitial());
  int numberofTaspeha = 0;
  int _index = 0;

  final List<String> _taspehs = [
    'سبحان الله',
    'الحمد لله',
    'الله أكبر',
  ];
  String currentTaspeh = '';
  void inital() {
    currentTaspeh = _taspehs[_index];
  }

  void changeCurrentTaspeh() {
    if (_index == _taspehs.length) {
      _index = 0;
    }
    inital();
  }

  void taspehaIncrease() async {
    if (numberofTaspeha == 33) {
      numberofTaspeha = 0;
      _index++;
      changeCurrentTaspeh();
      emit(Taspeha());
      return;
    }
    numberofTaspeha++;
    if (numberofTaspeha == 33) {
      if (_index + 1 == _taspehs.length) {
        currentTaspeh =
            'لا إله إلا الله، وحده لا شريك له، له الملك، وله الحمد، وهو على كل شيء قدير';
      } else {
        currentTaspeh = 'التسبيحه التالي';
      }
    }

    emit(Taspeha());
  }

  void reset() {
    numberofTaspeha = 0;
    emit(ResetTaspeha());
  }
}
