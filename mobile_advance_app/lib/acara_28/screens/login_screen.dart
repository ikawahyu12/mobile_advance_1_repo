import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets/jf_logo.dart';
import 'sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  void _submit() {
    if (_formKey.currentState!.validate()) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Memproses login...')),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 
          24, vertical: 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  alignment: Alignment.centerLeft,
                  onPressed:() => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_back, color: 
                  AppColors.textDark),
                ),
                const Center(
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: AppColors.primaryBlue,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Email or Mobile Number',
                    style: TextStyle(fontSize: 13, 
                    fontWeight: FontWeight.w600)),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _emailController,
                  decoration: 
                  const InputDecoration(hintText: 
                  'example@example.com'),
                  validator: (value) =>
                      (value == null || 
                      value.isEmpty) ? 'Wajib diisi' : null,
                ),
                const SizedBox(height: 16),
                const Text('Password',
                    style: TextStyle(fontSize: 13, 
                    fontWeight: FontWeight.w600)),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    hintText: '••••••••',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        size: 20,
                        color: AppColors.textGrey,
                      ),
                      onPressed: () =>
                          setState(() => _obscurePassword = 
                          !_obscurePassword),
                    ),
                  ),
                  validator: (value) =>
                      (value == null || value.isEmpty) ? 
                      'Wajib diisi' : null,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Forget Password',
                        style: TextStyle(color:
                         AppColors.primaryBlue, 
                         fontSize: 12)),
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(onPressed: _submit, child: 
                const Text('Log In')),
                const SizedBox(height: 24),
                Row(
                  children: const [
                    Expanded(child: Divider(color: 
                    AppColors.divider)),
                    Padding(
                      padding: 
                      EdgeInsets.symmetric(horizontal: 8),
                      child: Text('or Log in with',
                          style: TextStyle(color:
                           AppColors.textGrey, 
                           fontSize: 12)),
                    ),
                    Expanded(child: Divider(color: 
                    AppColors.divider)),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SocialIconButton(icon: 
                    Icons.g_mobiledata),
                    const SizedBox(width: 16),
                    const SocialIconButton(icon: 
                    Icons.facebook),
                    const SizedBox(width: 16),
                    const SocialIconButton(icon: 
                    Icons.apple),
                  ],
                ),
                const SizedBox(height: 24),
                Center(
                  child: Wrap(
                    children: [
                      const Text("Don't have an account? ",
                          style: TextStyle(color:
                        AppColors.textGrey, fontSize: 13)),
                      GestureDetector(
                        onTap: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: 
                            (_) => const SignUpScreen()),
                          );
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: AppColors.primaryBlue,
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}