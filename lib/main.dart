import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snapbut/Providers/cartprovider.dart';
import 'package:snapbut/Screens/home.dart';

void main() {
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return 
    ChangeNotifierProvider(
      create: ((context) => CartProvider()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: Scaffold(
          body: Home(),
        ),
      ),
    );
  }
}
