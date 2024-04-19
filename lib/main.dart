import 'package:flutter/material.dart';

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
      home: const HomePage(),
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
                  errorMessage = null;
                });
                final repo = FakeRepository();
                final result = await repo.fetchData();
                setState(() {
                  number += 1; 
                  errorMessage = result;
                  isLoading = false;
                });
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
    return 'KLASA';
  }
}