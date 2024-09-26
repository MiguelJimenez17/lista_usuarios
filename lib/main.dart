import 'package:flutter/material.dart';
import 'package:lista_usuarios/screen/ListScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'control usuarios',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(229, 57, 53, 6),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ListScreen(),
      },
    );
  }
}
