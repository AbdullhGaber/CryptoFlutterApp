import 'package:flutter_project_2/core/utils/app_assets.dart';
import 'package:flutter_project_2/core/utils/app_val.dart';
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
            horizontal: AppVal.padding24(context),
            vertical: AppVal.padding16(context),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppVal.verticalSpace24(context),
              Container(
                height: Responsive.value(context, 48),
                decoration: BoxDecoration(
                  color: AppRawColors.surfaceDark,
                  borderRadius: AppVal.borderRadius24(context),
                ),
                child: Row(
                  children: [
                    _buildTabButton(
                      title: Loc.auth.signInHeader,
                      isSelected: _isSignIn,
                      onTap: () => setState(() => _isSignIn = true),
                    ),
                    _buildTabButton(
                      title: Loc.auth.signUpHeader,
                      isSelected: !_isSignIn,
                      onTap: () => setState(() => _isSignIn = false),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Responsive.value(context, 40)),

              Text(
                _isSignIn ? Loc.auth.signInHeader : Loc.auth.signUpHeader,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              AppVal.verticalSpace32(context),
              CustomTextField(
                controller: _emailController,
                label: _isEmailMode
                    ? Loc.auth.emailLabel
                    : Loc.auth.mobileNumber,
                hintText: _isEmailMode
                    ? Loc.auth.enterEmail
                    : Loc.auth.enterMobile,
                actionText: _isSignIn
                    ? (_isEmailMode
                          ? Loc.auth.signInWithMobile
                          : Loc.auth.signInWithEmail)
                    : (_isEmailMode
                          ? Loc.auth.registerWithMobile
                          : Loc.auth.registerWithEmail),
                onActionTap: () => setState(() => _isEmailMode = !_isEmailMode),
              ),
              AppVal.verticalSpace24(context),

              CustomTextField(
                controller: _passwordController,
                label: Loc.auth.passwordLabel,
                hintText: Loc.auth.enterPassword,
                isPassword: true,
              ),
              AppVal.verticalSpace16(context),

              if (_isSignIn)
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    Loc.auth.forgotPassword,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: Responsive.text(context, AppVal.val14),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              AppVal.verticalSpace32(context),

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
                child: Text(
                  _isSignIn ? Loc.auth.signInHeader : Loc.auth.signUpHeader,
                ),
              ),
              AppVal.verticalSpace32(context),

              Center(
                child: Text(
                  Loc.auth.orLoginWith,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              AppVal.verticalSpace16(context),
              Row(
                children: [
                  SocialButton(
                    text: Loc.auth.facebook,
                    iconPath: AppAssets.imagesFacebookIcon,
                    onPressed: () {},
                  ),
                  AppVal.horizontalSpace16(context),
                  SocialButton(
                    text: Loc.auth.google,
                    iconPath: AppAssets.imagesGoogleIcon,
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
                        icon: Icon(
                          Icons.fingerprint,
                          color: AppRawColors.primaryDark,
                        ),
                        onPressed: () {}, // Handle biometric auth
                      ),
                      AppVal.verticalSpace8(context),
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

  Widget _buildTabButton({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected
                ? AppRawColors.backgroundDark
                : Colors.transparent,
            borderRadius: AppVal.borderRadius24(context),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: Responsive.value(context, AppVal.val4),
                      offset: Offset(0, Responsive.value(context, 2)),
                    ),
                  ]
                : [],
          ),
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : AppRawColors.textSecondaryDark,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: Responsive.text(context, AppVal.val14),
            ),
          ),
        ),
      ),
    );
  }
}
