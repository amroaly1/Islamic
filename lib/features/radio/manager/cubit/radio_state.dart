abstract class RadioState {}

final class RadioInitial extends RadioState {}

final class RadioGetDataLoading extends RadioState {}

final class RadioGetDataSuccess extends RadioState {}

final class RadioGetDataFailure extends RadioState {
  final String message;

  RadioGetDataFailure({required this.message});
}
