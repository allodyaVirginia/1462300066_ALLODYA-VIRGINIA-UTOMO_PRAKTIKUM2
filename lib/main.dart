import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      // MENGHILANGKAN DEBUG BANNER
      debugShowCheckedModeBanner: false,

      // JUDUL APLIKASI
      title: 'Cinema App',

      // TEMA APLIKASI
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: Colors.grey[200],
      ),

      // HALAMAN PERTAMA
      home: const HomePage(),
    );
  }
}