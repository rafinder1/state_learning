part of 'home_cubit.dart';

class HomeState {
  HomeState({
    this.number = 1,
    this.errorMessage,
    this.isLoading = false,
  });

  final int number;
  final String? errorMessage;
  final bool isLoading;
}
