part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(1) int number,
    String? errorMessage,
    String? results,
    @Default(false) bool  isLoading,
  }) = _HomeState;
}


// class HomeState {
//   const HomeState({
//     this.number = 1,
//     this.errorMessage,
//     this.results,
//     this.isLoading = false,
//   });

//   final int number;
//   final String? errorMessage;
//   final String? results;
//   final bool isLoading;

//   HomeState copyWith({
//     int? number,
//     String? errorMessage,
//     String? results,
//     bool? isLoading,
//   }) {
//     return HomeState(
//       number: number ?? this.number,
//       errorMessage: errorMessage ?? this.errorMessage,
//       results: results ?? this.results,
//       isLoading: isLoading ?? this.isLoading,
//     );
//   }
// }
