import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/responsive/responsive.dart';
import 'package:flutter_application_1/views/mobile/features/features.dart';
import 'package:flutter_application_1/views/web/features/features.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Online Podcasts | Free unlimted podcasts.',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Responsive(
          web: WebLandingPage(),
          mobile: MobileLandingPage(),
        ));
  }
}
