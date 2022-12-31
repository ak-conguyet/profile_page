import 'package:flutter/material.dart';
import 'package:profile_page/MyColors.dart';

import 'MyHomePage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anh Kiệt',
      theme: ThemeData.from(
        colorScheme: ColorScheme.light(
          primary: color1,
          secondary: color2
        )
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

