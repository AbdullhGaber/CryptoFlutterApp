import 'package:flutter/material.dart';
import 'package:flutter_project_2/core/theme/styles/app_colors.dart';
import 'package:flutter_project_2/core/helpers/responsive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/routing/app_router.dart';
import '../../../core/storage/secure_storage_manager.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../widgets/social_button.dart';
import '../../../core/localization/loc.dart';

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
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.padding(context, 24),
            vertical: Responsive.padding(context, 16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Responsive.value(context, 24)),
              Container(
                height: Responsive.value(context, 48),
                decoration: BoxDecoration(
                  color: AppRawColors.surfaceDark,
                  borderRadius: BorderRadius.circular(Responsive.value(context, 24)),
                ),
                child: Row(
                  children: [
                    _buildTabButton(title: Loc.auth.signInHeader, isSelected: _isSignIn, onTap: () => setState(() => _isSignIn = true)),
                    _buildTabButton(title: Loc.auth.signUpHeader, isSelected: !_isSignIn, onTap: () => setState(() => _isSignIn = false)),
                  ],
                ),
              ),
              SizedBox(height: Responsive.value(context, 40)),

              Text(
                _isSignIn ? Loc.auth.signInHeader : Loc.auth.signUpHeader,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(height: Responsive.value(context, 32)),
              CustomTextField(
                controller: _emailController,
                label: _isEmailMode ? Loc.auth.emailLabel : Loc.auth.mobileNumber,
                hintText: _isEmailMode ? Loc.auth.enterEmail : Loc.auth.enterMobile,
                actionText: _isSignIn
                    ? (_isEmailMode ? Loc.auth.signInWithMobile : Loc.auth.signInWithEmail)
                    : (_isEmailMode ? Loc.auth.registerWithMobile : Loc.auth.registerWithEmail),
                onActionTap: () => setState(() => _isEmailMode = !_isEmailMode),
              ),
              SizedBox(height: Responsive.value(context, 24)),

              CustomTextField(
                controller: _passwordController,
                label: Loc.auth.passwordLabel,
                hintText: Loc.auth.enterPassword,
                isPassword: true,
              ),
              SizedBox(height: Responsive.value(context, 16)),

              if (_isSignIn)
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    Loc.auth.forgotPassword,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: Responsive.text(context, 14),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              SizedBox(height: Responsive.value(context, 32)),

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
                child: Text(_isSignIn ? Loc.auth.signInHeader : Loc.auth.signUpHeader),
              ),
              SizedBox(height: Responsive.value(context, 32)),

              Center(
                child: Text(
                  Loc.auth.orLoginWith,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              SizedBox(height: Responsive.value(context, 16)),
              Row(
                children: [
                  SocialButton(
                    text: Loc.auth.facebook,
                    iconPath: 'assets/images/facebook_icon.png',
                    onPressed: () {},
                  ),
                  SizedBox(width: Responsive.value(context, 16)),
                  SocialButton(
                    text: Loc.auth.google,
                    iconPath: 'assets/images/google_icon.png',
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: Responsive.value(context, 48)),

              if (_isSignIn)
                Center(
                  child: Column(
                    children: [
                      IconButton(
                        iconSize: Responsive.icon(context, 48),
                        icon: Icon(Icons.fingerprint, color: AppRawColors.primaryDark),
                        onPressed: () {}, // Handle biometric auth
                      ),
                      SizedBox(height: Responsive.value(context, 8)),
                      Text(
                        Loc.auth.useFingerprint,
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
            color: isSelected ? AppRawColors.backgroundDark : Colors.transparent,
            borderRadius: BorderRadius.circular(Responsive.value(context, 24)),
            boxShadow: isSelected
                ? [BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: Responsive.value(context, 4), offset: Offset(0, Responsive.value(context, 2)))]
                : [],
          ),
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : AppRawColors.textSecondaryDark,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: Responsive.text(context, 14),
            ),
          ),
        ),
      ),
    );
  }
}