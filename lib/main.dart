import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/models/navigationItem.dart';
import 'package:recipe_app/navigation_menu.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        // colorScheme: const ColorScheme.light(),
        scaffoldBackgroundColor: Colors.white,
        // backgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(color: Colors.white, elevation: 0),
        // visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const NavigationMenu(),
    );
  }
}