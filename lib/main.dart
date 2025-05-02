import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/home/home_page/home_page.dart';
import 'models/user_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => UserModel(),
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tree Info App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(), // 👈 your home screen
    );
  }
}
