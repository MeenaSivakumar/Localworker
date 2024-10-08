
import 'package:flutter/material.dart';
import 'package:work_zone/controllers/auth_controller.dart';
import 'package:work_zone/utils/app_theme.dart';
import 'package:work_zone/widgets/widgets_helper.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: Text(
          'Forgot password',
          style: AppTheme.themeData.textTheme.headlineMedium!.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppTheme.backgroundColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Reset Password',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.blackColor,
                  ),
                ),
                const SizedBox(height: 24),
               WidgetHelper.customTextField(controller: _emailController, labelText: 'Enter Your email'),
                const SizedBox(height: 24),
                _isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {
                         AuthController().resetPassword(_emailController.text,context);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15),
                          backgroundColor: AppTheme.primaryColor,
                        ),
                        child: const Text(
                          'Send Reset Link',
                          style: TextStyle(color: AppTheme.whiteColor),
                        ),
                      ),
              ]),
        ),
      ),
    );
  }
}
