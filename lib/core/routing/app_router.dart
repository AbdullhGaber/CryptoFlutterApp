import 'package:flutter_project_2/core/layout/app_layout.dart';
import 'package:flutter_project_2/features/auth/screens/auth_screen.dart';
import 'package:flutter_project_2/features/splash/screens/splash_screen.dart';
import 'package:flutter_project_2/features/profile/presentation/screens/settings_screen.dart';
import 'package:flutter_project_2/features/profile/presentation/screens/profile_screen.dart';
import 'package:flutter_project_2/features/market/presentation/screens/favorites_screen.dart';
import 'package:flutter_project_2/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String auth = '/auth';
  static const String appLayout = '/appLayout';
  static const String settings = '/settings';
  static const String profile = '/profile';
  static const String favorites = '/favorites';

  static final router = GoRouter(
    initialLocation: appLayout,
    routes: [
      GoRoute(path: splash, builder: (context, state) => const SplashScreen()),

      GoRoute(
        path: onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),

      GoRoute(path: auth, builder: (context, state) => const AuthScreen()),

      GoRoute(path: appLayout, builder: (context, state) => const AppLayout()),

      GoRoute(
        path: settings,
        builder: (context, state) => const SettingsScreen(),
      ),

      GoRoute(
        path: profile,
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: favorites,
        builder: (context, state) => const FavoritesScreen(),
      ),
    ],
  );
}
