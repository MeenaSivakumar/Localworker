import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_zone/controllers/auth_controller.dart';
import 'package:work_zone/views/worker/auth/forgot_password.dart';
import 'package:work_zone/views/worker/auth/worker_signup_page.dart';
import 'package:work_zone/views/worker/home/worker_home_page.dart';

import '../../../utils/app_theme.dart';
import '../../../widgets/widgets_helper.dart';

class WorkerLoginPage extends StatefulWidget {
  const WorkerLoginPage({super.key});

  @override
  State<WorkerLoginPage> createState() => _WorkerLoginPageState();
}

class _WorkerLoginPageState extends State<WorkerLoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
     final authController = Provider.of<AuthController>(context);
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Welcome Back',
                style: AppTheme.themeData.textTheme.headlineMedium!.copyWith( fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.blackColor),
                
              ),
              const SizedBox(
                height: 16,
              ),
              WidgetHelper.customTextField(
                  controller: _emailController,
                  labelText: 'email',
                  prefixIcon: Icons.email),
              const SizedBox(
                height: 16,
              ),
              WidgetHelper.customTextField(
                controller: _passwordController,
                labelText: 'Password',
                prefixIcon: Icons.lock,
              ),
              const SizedBox(height: 24,),
               RichText(
                text: TextSpan(
                  text: 'Forgot Password?',
                  style: const TextStyle(color: AppTheme.blackColor),
                  children: [
                    TextSpan(
                      text: 'click here',
                      style: const TextStyle(
                        color: AppTheme.primaryColor,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ForgotPassword(),
                            ),
                          );
                        },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              authController.isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                    
                        AuthController().login(
                          _emailController.text,
                          _passwordController.text,
                          context,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                        backgroundColor: AppTheme.primaryColor,
                      ),
                      child: const Text('Log In',
                          style: TextStyle(
                            color: AppTheme.whiteColor,
                          )),
                    ),
              if (authController.errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    authController.errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
                const SizedBox(
                height: 28,
              ),
               RichText(
                text: TextSpan(
                  text: "Don't have an Account?",
                  style: const TextStyle(color: AppTheme.blackColor),
                  children: [
                    TextSpan(
                      text: 'sign up',
                      style: const TextStyle(
                        color: AppTheme.primaryColor,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const WorkerSignupPage(),
                            ),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
