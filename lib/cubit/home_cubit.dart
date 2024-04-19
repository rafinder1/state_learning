import 'package:bloc/bloc.dart';
import 'package:state_learning/main.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._fakeRepository) : super(const HomeState());
  final FakeRepository _fakeRepository;

  Future<void> fetchData() async {
    emit(HomeState(
      isLoading: true,
      number: state.number,
    ));

    try {
      final results = await _fakeRepository.fetchData();
      emit(HomeState(
        isLoading: false,
        results: results,
        number: state.number + 1,
      ));
    } catch (exception) {
      emit(HomeState(
        isLoading: false,
        errorMessage: exception.toString(),
        number: state.number - 1,
      ));
    }
  }
}
