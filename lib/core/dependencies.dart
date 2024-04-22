import 'package:get_it/get_it.dart';
import 'package:state_learning/cubit/home_cubit.dart';
import 'package:state_learning/datasources/remote_data_source.dart';
import 'package:state_learning/repositories/fake_repository.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  getIt.registerLazySingleton<RemoteDataSource>(() => RemoteDataSource());
  getIt.registerLazySingleton<FakeRepository>(() => FakeRepository(getIt()));
  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(getIt()));
}