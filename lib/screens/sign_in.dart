import 'package:flutter/material.dart';
import 'package:mqtt_controller/screens/sign_up.dart';
import 'package:mqtt_controller/widgets/overlay_widget.dart';
import 'package:mqtt_controller/widgets/text_field.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import '../widgets/buttons.dart';
import 'HomeScreen.dart';
import 'home.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _hidePassword = true;
  final _formKey = GlobalKey<FormState>();

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
                "SIGN IN",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Sign in with email address",
                style: TextStyle(),
              ),
              const SizedBox(
                height: 20,
              ),
              InputText(
                label: "E-Mail",
                hintText: "Email",
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  }
                  return null;
                },
              ),
              InputText(
                label: "Password",
                hintText: "Password",
                controller: _passwordController,
                hideText: _hidePassword,
                trailingIcon: _hidePassword == true
                    ? Icons.visibility
                    : Icons.visibility_off,
                onTrailingIconPressed: () {
                  _togglePasswordVisibility();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your Password";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              LargeButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      await authProvider.signInWithEmailAndPassword(
                        _emailController.text,
                        _passwordController.text,
                      );
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => HomeScreen()));
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(e.toString())),
                      );
                    }
                  }
                },
                label: "Sign In",
              ),
              const SizedBox(height: 40),
              const Text(
                "or continue with",
                style: TextStyle(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          try {
                            _overlayWidget.show(
                                widget:
                                    LoadingWidget(400, 400, _overlayWidget));
                            await authProvider.signInWithGoogle();
                            _overlayWidget.hide();
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (_) => HomeScreen()));
                          } catch (e) {
                            _overlayWidget.hide();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(e.toString())),
                            );
                          }
                        },
                        child: Text('Google'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          try {
                            await authProvider.signInWithFacebook();
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (_) => HomeScreen()));
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(e.toString())),
                            );
                          }
                        },
                        child: Text('Facebook'),
                      ),
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => SignUpScreen()));
                },
                child: const Text('Don\'t have an account? Sign up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
