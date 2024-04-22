import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_learning/core/dependencies.dart';
import 'package:state_learning/cubit/home_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeCubitPage(),
    );
  }
}

class HomeCubitPage extends StatelessWidget {
  const HomeCubitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.errorMessage ?? ''),
                  Text(
                    '${state.number}',
                    style: const TextStyle(fontSize: 40),
                  ),
                  Text(
                    state.results ?? '' ,
                    style: const TextStyle(fontSize: 20),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      context.read<HomeCubit>().fetchData();
                    },
                    child: const Text('Jazda w to!'),
                  ),
                  if (state.isLoading) const CircularProgressIndicator(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}



