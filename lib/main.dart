import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mqtt_controller/providers/auth_provider.dart';
import 'package:mqtt_controller/screens/HomeScreen.dart';
import 'package:mqtt_controller/screens/home.dart';
import 'package:mqtt_controller/screens/sign_in.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: authProvider.user == null ? LoginScreen() : HomeScreen(),
      ),
    );
  }
}
