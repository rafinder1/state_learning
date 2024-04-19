part of 'home_cubit.dart';

class HomeState {
  const HomeState({
    this.number = 1,
    this.errorMessage,
    this.results,
    this.isLoading = false,
  });

  final int number;
  final String? errorMessage;
  final String? results;
  final bool isLoading;
}
