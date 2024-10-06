import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthController  with ChangeNotifier{
  final FirebaseAuth auth = FirebaseAuth.instance;

 bool _isLoading =false;
 String? _errorMessage;

 bool get isLoading => _isLoading;
 String? get errorMessage => _errorMessage;

Future<void> signUp(String email, String password) async {
    _setLoading(true);
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      _errorMessage = e.message;
    } finally {
      _setLoading(false);
    }
  }
  Future<void> login(String email, String password) async {
    _setLoading(true);
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      _errorMessage = e.message;
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }
  void clearError(){
    _errorMessage = null;
    notifyListeners();
  }

}