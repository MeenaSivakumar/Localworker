import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_zone/controllers/auth_controller.dart';
import 'package:work_zone/utils/app_theme.dart';
import 'package:work_zone/views/worker/auth/worker_login_page.dart';
import 'package:work_zone/views/worker/home/worker_home_page.dart';
import 'package:work_zone/widgets/widgets_helper.dart';


class WorkerSignupPage extends StatefulWidget {
  const WorkerSignupPage({super.key});

  @override
  State<WorkerSignupPage> createState() => _WorkerSignupPageState();
}

class _WorkerSignupPageState extends State<WorkerSignupPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool _agreeToTerms = false;

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
                "Create Account",
                style: AppTheme.themeData.textTheme.headlineMedium!.copyWith(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.blackColor),
              ),
              const SizedBox(
                height: 16,
              ),
              WidgetHelper.customTextField(
                controller: _nameController,
                labelText: 'Full Name',
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
              const SizedBox(
                height: 16,
              ),
              Row(
                children: <Widget>[
                  Checkbox(
                    value: _agreeToTerms,
                    onChanged: (value) {
                      setState(() {
                        _agreeToTerms = value!;
                      });
                    },
                    activeColor: AppTheme.primaryColor,
                  ),
                  Expanded(
                    child: Text(
                      'I agree to the Terms and Conditions',
                      style: AppTheme.themeData.textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 28,
              ),
              authController.isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const WorkerHomePage()));
                        authController.signUp(
                          _emailController.text,
                          _passwordController.text,
                          _nameController.text,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                        backgroundColor: AppTheme.primaryColor,
                      ),
                      child: const Text('Sign Up',
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
                height: 24,
              ),
              RichText(
                text: TextSpan(
                  text: 'Already have an account?',
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
                              builder: (context) => const WorkerLoginPage(),
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
