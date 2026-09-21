import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets/jf_logo.dart';
import 'login_screen.dart';
import 'sign_up_screen.dart';
class LoginOrSignupScreen extends StatelessWidget {
  const LoginOrSignupScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              const Spacer(flex: 3),
              const JFLogo(size: 72, background:
               AppColors.inputFill),
              const SizedBox(height: 16),
              const Text(
                'JOB FINDER',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.primaryBlue,
                  fontSize: 22,
                  fontWeight: FontWeight.w800,),),
              const SizedBox(height: 4),
              const Text(
                'Temukan kerja tanpa ribet',
                style: TextStyle(color:
                 AppColors.textGrey, fontSize: 12),),
              const Spacer(flex: 4),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder:
                     (_) => const LoginScreen()),);
                },
                child: const Text('Log In'),
              ),
              const SizedBox(height: 14),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.lightBlue,
                  foregroundColor: AppColors.primaryBlueDark,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder:
                     (_) => const SignUpScreen()),
                  );
                },
                child: const Text('Sign Up'),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}