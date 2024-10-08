import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:work_zone/views/worker/home/worker_home_page.dart';

class AuthController with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Sign up with email, password, and full name
  Future<void> signUp(String email, String password, String fullName,BuildContext context) async {
    _setLoading(true);
    try {
      // Firebase Authentication Signup
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      // Store user data in Firestore
      User? user = userCredential.user;
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).set({
          'uid': user.uid,
          'email': email,
          'fullName': fullName,
          'createdAt': Timestamp.now(),
        });

        Fluttertoast.showToast(
          msg: "Sign-up sucessful!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 10,
        );
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const WorkerHomePage()));
      }
    } on FirebaseAuthException catch (e) {
      _errorMessage = e.message;
      Fluttertoast.showToast(
          msg: "Sign-up failed",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 10,
        );
    } finally {
      _setLoading(false);
    }

     

  }

  // Login function
  Future<void> login(String email, String password,BuildContext context) async {
    _setLoading(true);
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      Fluttertoast.showToast(
          msg: "Log-In sucessful!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 10,
        );
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const WorkerHomePage()));
      }on FirebaseAuthException catch (e) {
      _errorMessage = e.message;
        Fluttertoast.showToast(
          msg: "Log-In failed!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 10,
        );
    } finally {
      _setLoading(false);
    }
  }

  // Logout function
  Future<void> logout() async {
    await _auth.signOut();
  }

 

  Future<void> resetPassword(String email,BuildContext context) async {
    _setLoading(true);
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password rest link has been sent to your email'),
        ),
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage = '';
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found with this email';
      } else {
        errorMessage = 'An error occured.please try again.';
      }
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(errorMessage)));
    }
  }
  // Helper method to handle loading state
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Clear error message
  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
