import 'package:flutter/material.dart';
import 'package:spotify_clone/domain/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Poppins",
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: AppRoutes.getRoutes(),
      initialRoute: AppRoutes.splash_page,
      // initialRoute: AppRoutes.dashboard_page,
    );
  }
}
