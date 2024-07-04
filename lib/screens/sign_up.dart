import 'package:flutter/material.dart';
import 'package:mqtt_controller/screens/sign_in.dart';
import 'package:mqtt_controller/widgets/buttons.dart';
import 'package:mqtt_controller/widgets/text_field.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import '../widgets/overlay_widget.dart';
import 'HomeScreen.dart';
import 'home.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _hidePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final OverlayWidget _overlayWidget = OverlayWidget(context: context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "SIGN UP",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              InputText(
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                label: "Email",
                hintText: 'Email',
              ),
              InputText(
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                label: "Password",
                hintText: "Password",
                hideText: true,
              ),
              InputText(
                controller: _confirmPasswordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  } else if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                label: "Confirm Password",
                hintText: "Confirm Password",
                hideText: _hidePassword,
                trailingIcon: _hidePassword == true
                    ? Icons.visibility
                    : Icons.visibility_off,
                onTrailingIconPressed: () {
                  _togglePasswordVisibility();
                },
              ),
              InputText(
                controller: _usernameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
                label: "Username",
                hintText: "Username",
              ),
              const SizedBox(
                height: 20,
              ),
              LargeButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      _overlayWidget.show(
                          widget: LoadingWidget(400, 400, _overlayWidget));
                      await authProvider.signUpWithEmailAndPassword(
                        _emailController.text,
                        _passwordController.text,
                        _usernameController.text,
                      );
                      _overlayWidget.hide();
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => HomeScreen()));
                    } catch (e) {
                      _overlayWidget.hide();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(e.toString())),
                      );
                    }
                  }
                },
                label: "Sign Up",
              ),
              const SizedBox(
                height: 40,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => LoginScreen()));
                },
                child: const Text('Already have an account? Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
