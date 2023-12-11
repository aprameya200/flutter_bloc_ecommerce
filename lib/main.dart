
import 'package:bloc_e_commerce/features/item/ui/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'features/home/ui/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle( //to set the color of entire screen and not miss the bottom bar
      systemNavigationBarColor: Color(0xFFF1EBEB), // Set navigation bar color
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ItemPage(),
    );
  }
}
