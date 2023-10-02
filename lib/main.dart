import 'package:flutter/material.dart';
import 'package:image_search/di/provider_setup.dart';
import 'package:image_search/presentation/home/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: globalProviders,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

// https://pixabay.com/api/?key=39735462-7b5946eb6bf26485274c64c9b&q=iphone&image_type=photo
