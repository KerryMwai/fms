import 'package:flutter/material.dart';
import 'package:fms/controller/user_controller.dart';
import 'package:fms/services/firebase-manager.dart';
import 'package:fms/services/fms-change-notifier.dart';

import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'auth/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await FirebaseFirestore.instance.settings();
  FirebaseOptions firebaseOptions = const FirebaseOptions(
    projectId: 'farm-management-system-548dc',
    messagingSenderId: '972089465483',
    appId: '1:972089465483:android:3e4fdc855e194e2e2ed28e',
    apiKey: 'AIzaSyANSDz6JQau_J-jRkOg2qjuzSG1AJzv5qQ',
  );
  await Firebase.initializeApp(options: firebaseOptions);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => FmsChanageNotifier()),
      ChangeNotifierProvider(create: (context)=>FirebaseManager()),
      ChangeNotifierProvider(create: (context)=>UserController())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Farm management system',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage()
    );
  }
}

// const HomePage()
