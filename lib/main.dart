import 'package:contratado/src/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
