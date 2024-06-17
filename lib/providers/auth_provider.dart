import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  User? _user;
  User? get user => _user;

  AuthProvider() {
    _firebaseAuth.authStateChanges().listen(_onAuthStateChanged);
    _loadUser();
  }

  Future<void> _loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('auth_token');
    if (token != null) {
      _user = _firebaseAuth.currentUser;
      notifyListeners();
    }
  }

  Future<void> signUpWithEmailAndPassword(
      String email, String password, String username) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      await _saveUserToken(userCredential.user);
      await _saveUsername(username, userCredential.user!.uid);
    } on FirebaseAuthException catch (e) {
      await _deleteUser(_firebaseAuth.currentUser!);
      print(e);
      throw e.message ?? 'An unknown error occurred';
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      await _saveUserToken(userCredential.user);
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'An unknown error occurred';
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await _clearUserToken();
    _user = null;
    notifyListeners();
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      await _saveUserToken(userCredential.user);
      await _saveUsername(
          userCredential.user!.displayName!, userCredential.user!.uid);
    } catch (e) {
      throw 'Google sign-in failed';
    }
  }

  Future<void> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(result.accessToken!.tokenString);
      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(facebookAuthCredential);
      await _saveUserToken(userCredential.user);
      await _saveUsername(
          userCredential.user!.displayName!, userCredential.user!.uid);
    } catch (e) {
      print(e);
      throw 'Facebook sign-in failed';
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
      throw 'Failed to save username';
    }
  }

  Future<void> _deleteUser(User user) async {
    try {
      await user.delete();
    } catch (e) {
      throw 'Failed to delete user';
    }
  }

  Future<void> _onAuthStateChanged(User? user) async {
    _user = user;
    notifyListeners();
  }
}
