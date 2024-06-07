import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDT9qFl5KVI7tpe_87CaXdvaZ_q8fxmE6s",
          authDomain: "portfolio-website-1cb5c.firebaseapp.com",
          projectId: "portfolio-website-1cb5c",
          storageBucket: "portfolio-website-1cb5c.appspot.com",
          messagingSenderId: "53607080056",
          appId: "1:53607080056:web:cb7c03c17d2d932a2e0d8d",
          measurementId: "G-LV4109XNMD"),
    );
    print('Firebase initialized successfully');
  } catch (e) {
    print('Firebase initialization error: $e');
    
  }
  runApp(MyPortfolio());
}

class MyPortfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Vishal Chikani',
      home: const HomePage(),
    );
  }
}
