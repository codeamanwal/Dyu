import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../services/firebase_auth_service.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuthService _authService = FirebaseAuthService();
  User? _user;
  User? get user => _user;

  AuthProvider() {
    _authService.authStateChanges.listen(_onAuthStateChanged);
    _loadUser();
  }

  Future<void> _loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('auth_token');
    if (token != null) {
      _user = _authService.currentUser;
      notifyListeners();
    }
  }

  Future<void> signUpWithEmailAndPassword(
      String email, String password, String username) async {
    try {
      User? user =
          await _authService.signUpWithEmailAndPassword(email, password);
      if (user != null) {
        await _saveUserToken(user);
        await _saveUsername(username, user.uid);
      }
    } on FirebaseAuthException catch (e) {
      if (_authService.currentUser != null) {
        await _authService.deleteUser(_authService.currentUser!);
      }
      print(e);
      throw e.message ?? 'An unknown error occurred';
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      User? user =
          await _authService.signInWithEmailAndPassword(email, password);
      await _saveUserToken(user);
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'An unknown error occurred';
    }
  }

  Future<void> signOut() async {
    await _authService.signOut();
    await _clearUserToken();
    _user = null;
    notifyListeners();
  }

  Future<void> signInWithGoogle() async {
    try {
      User? user = await _authService.signInWithGoogle();
      if (user != null) {
        await _saveUserToken(user);
        await _saveUsername(user.displayName!, user.uid);
      }
    } catch (e) {
      throw 'Google sign-in failed: $e';
    }
  }

  Future<void> signInWithFacebook() async {
    try {
      User? user = await _authService.signInWithFacebook();
      if (user != null) {
        await _saveUserToken(user);
        await _saveUsername(user.displayName!, user.uid);
      }
    } catch (e) {
      throw 'Facebook sign-in failed: $e';
    }
  }

  Future<void> _saveUserToken(User? user) async {
    if (user != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = await user.getIdToken();
      await prefs.setString('auth_token', token!);
      _user = user;
      notifyListeners();
    }
  }

  Future<void> _clearUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
  }

  Future<void> _saveUsername(String username, String uid) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .set({'username': username});
    } catch (e) {
      throw 'Failed to save username: $e';
    }
  }

  Future<void> _onAuthStateChanged(User? user) async {
    _user = user;
    notifyListeners();
  }
}
