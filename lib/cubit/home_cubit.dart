import 'package:bloc/bloc.dart';
import 'package:state_learning/main.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._fakeRepository) : super(const HomeState());
  final FakeRepository _fakeRepository;

  Future<void> fetchData() async {
    emit(
      state.copyWith(isLoading: true)
    );
    try {
      final results = await _fakeRepository.fetchData();
      emit(state.copyWith(
        isLoading: false,
        results: results,
        number: state.number + 1,
      ));
    } catch (exception) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: exception.toString(),
        number: state.number - 1,
      ));
    }
  }
}
