import 'package:flutter/material.dart';
import 'package:flutter_project_2/core/theme/styles/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/routing/app_router.dart';
import '../../../core/storage/secure_storage_manager.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../widgets/social_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isSignIn = true;
  bool _isEmailMode = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Container(
                height: 48,
                decoration: BoxDecoration(
                  color: AppRawColors.surfaceDark,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    _buildTabButton(title: 'Sign in', isSelected: _isSignIn, onTap: () => setState(() => _isSignIn = true)),
                    _buildTabButton(title: 'Sign up', isSelected: !_isSignIn, onTap: () => setState(() => _isSignIn = false)),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              Text(
                _isSignIn ? 'Sign in' : 'Sign up',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 32),
              CustomTextField(
                controller: _emailController,
                label: _isEmailMode ? 'Email' : 'Mobile Number',
                hintText: _isEmailMode ? 'Enter your email' : 'Enter your mobile',
                actionText: _isSignIn
                    ? (_isEmailMode ? 'Sign in with mobile' : 'Sign in with email')
                    : (_isEmailMode ? 'Register with mobile' : 'Register with email'),
                onActionTap: () => setState(() => _isEmailMode = !_isEmailMode),
              ),
              const SizedBox(height: 24),

              CustomTextField(
                controller: _passwordController,
                label: 'Password',
                hintText: 'Enter your password',
                isPassword: true,
              ),
              const SizedBox(height: 16),

              if (_isSignIn)
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              const SizedBox(height: 32),

              ElevatedButton(
                onPressed: () async {
                  if (!_isSignIn) {
                    final storage = context.read<SecureStorageManager>();
                    await storage.saveCredentials(
                      _emailController.text,
                      _passwordController.text,
                    );

                    if (mounted) context.push(AppRouter.profile);
                  } else {
                    // Handle Sign In logic later
                  }
                },
                child: Text(_isSignIn ? 'Sign in' : 'Sign up'),
              ),
              const SizedBox(height: 32),

              Center(
                child: Text(
                  'Or login with',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  SocialButton(
                    text: 'Facebook',
                    iconPath: 'assets/images/facebook_icon.png',
                    onPressed: () {},
                  ),
                  const SizedBox(width: 16),
                  SocialButton(
                    text: 'Google',
                    iconPath: 'assets/images/google_icon.png',
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 48),

              if (_isSignIn)
                Center(
                  child: Column(
                    children: [
                      IconButton(
                        iconSize: 48,
                        icon: Icon(Icons.fingerprint, color: AppRawColors.primaryDark),
                        onPressed: () {}, // Handle biometric auth
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Use fingerprint instead?',
                        style: Theme.of(context).textTheme.bodyMedium,
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

  Widget _buildTabButton({required String title, required bool isSelected, required VoidCallback onTap}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? AppRawColors.backgroundDark : Colors.transparent, // Slightly lighter if selected
            borderRadius: BorderRadius.circular(24),
            boxShadow: isSelected
                ? [BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 4, offset: const Offset(0, 2))]
                : [],
          ),
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : AppRawColors.textSecondaryDark,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}