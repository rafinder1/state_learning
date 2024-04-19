import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_learning/cubit/home_cubit.dart';

void main() {
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
      create: (context) => HomeCubit(),
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
                  ElevatedButton(
                    onPressed: () async {
                      // setState(() {
                      //   isLoading = true;
                      // });
                      // final repo = FakeRepository();
                      // try {
                      //   await repo.fetchData();
                      //   setState(() {
                      //     number += 1;
                      //     errorMessage = null;
                      //     isLoading = false;
                      //   });
                      // } catch (exception) {
                      //   setState(() {
                      //     number -= 1;
                      //     errorMessage = exception.toString();
                      //     isLoading = false;
                      //   });
                      // }
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

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int number = 10;
  String? errorMessage;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(errorMessage ?? ''),
            Text(
              '$number',
              style: const TextStyle(fontSize: 40),
            ),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                final repo = FakeRepository();
                try {
                  await repo.fetchData();
                  setState(() {
                    number += 1;
                    errorMessage = null;
                    isLoading = false;
                  });
                } catch (exception) {
                  setState(() {
                    number -= 1;
                    errorMessage = exception.toString();
                    isLoading = false;
                  });
                }
              },
              child: const Text('Jazda w to!'),
            ),
            if (isLoading) const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

class FakeRepository {
  Future<String> fetchData() async {
    await Future.delayed(const Duration(seconds: 1));
    // throw Exception('Coś poszło nie tak!');
    return '';
  }
}
