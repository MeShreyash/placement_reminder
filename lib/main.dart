import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:placement_reminders/features/dashboard/views/screens/dashboard_screen.dart';

import 'config/routes/app_pages.dart';
import 'config/themes/app_theme.dart';
import 'features/dashboard/views/screens/add_company/add_company_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialise app based on platform- web or mobile
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBxz1dQzOuPTwqdb552R86Zfu1GNzV6Y_c",
          authDomain: "reminders-46172.firebaseapp.com",
          projectId: "reminders-46172",
          storageBucket: "reminders-46172.appspot.com",
          messagingSenderId: "515296954556",
          appId: "1:515296954556:web:5914e083c7b74205e168b9",
          measurementId: "G-EMWH504EJS"),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reminders',
      theme: AppTheme.light,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      scrollBehavior: CustomScrollBehaviour(),
      // home: StreamBuilder(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.active) {
      //       // Checking if the snapshot has any data or not
      //       if (snapshot.hasError) {
      //         return Center(
      //           child: Text('${snapshot.error}'),
      //         );
      //       }
      //     }

      //     // means connection to future hasnt been made yet
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }

      //     return DashboardScreen();
      //   },
      // ),
    );
  }
}

class CustomScrollBehaviour extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
