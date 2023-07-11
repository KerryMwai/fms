// import 'dart:io';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fms/controller/user_controller.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/pages/crop_managemnt/crop/records_growth_stages.dart';
import 'package:fms/pages/crop_managemnt/crop/view_crop_plans.dart';
import 'package:fms/pages/crop_managemnt/equipment/equipment_assignment_information.dart';
import 'package:fms/pages/home.dart';
import 'package:fms/services/firebase-manager.dart';
import 'package:fms/services/fms-change-notifier.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth/login.dart';
import 'firebase_options.dart';


final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return StreamBuilder<User?>(
        stream: UserController().authStateChanges,
        builder: (context, snapshot){
          if(snapshot.connectionState==ConnectionState.active){
            final user=snapshot.data;
            if(user==null){
              return const LoginPage();
            }else{
              return HomePage();
            }
          }else{
            return Center( child: CircularProgressIndicator(color: green,),);
          }
        });
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'crop-growth-records',
          builder: (BuildContext context, GoRouterState state) {
            return  CropGrowthRecords();
          },
        ),
        GoRoute(
          path: 'crop-plans',
          builder: (BuildContext context, GoRouterState state) {
            return const CropPlansPage();
          },
        ),
        GoRoute(
          path: 'equipment-assignment-information',
          builder: (BuildContext context, GoRouterState state) {
            return const EquipmentAssignmentInformation();
          },
        ),
      ],
    ),
  ],
);



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await FirebaseFirestore.instance.settings;
  // FirebaseOptions firebaseOptions = const FirebaseOptions(
  //   projectId: 'farm-management-system-548dc',
  //   messagingSenderId: '972089465483',
  //   appId: '1:972089465483:android:3e4fdc855e194e2e2ed28e',
  //   apiKey: 'AIzaSyANSDz6JQau_J-jRkOg2qjuzSG1AJzv5qQ',
  //   storageBucket: 'gs://farm-management-system-548dc.appspot.com'
  // );
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => FmsChanageNotifier()),
      ChangeNotifierProvider(create: (context)=>FirebaseManager()),
      ChangeNotifierProvider(create: (context)=>UserController())
    ],
    child:  MyApp(),
  ));
}

class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Farm management system',
    //   theme: ThemeData.light(),
    // );
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
    );
  }
}


