import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets/jf_logo.dart';
import 'login_or_signup_screen.dart';

/// Layar 1: Splash Screen — latar biru penuh dengan logo "JF"
/// dan teks "JOB FINDER" di tengah.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Pindah otomatis ke halaman Login/Signup setelah 2 detik.
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: 
        (_) => const LoginOrSignupScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            JFLogo(size: 88),
            SizedBox(height: 20),
            Text(
              'JOB FINDER',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 6),
            Text(
              'Temukan kerja tanpa ribet',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
