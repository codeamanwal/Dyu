import 'package:flutter/material.dart';
import 'package:mqtt_controller/screens/sign_in.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              authProvider.signOut();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => LoginScreen()));
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Welcome, ${authProvider.user?.email}'),
      ),
    );
  }
}
