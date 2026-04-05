import 'package:flutter/material.dart';
import 'package:flutter_project_2/core/theme/styles/app_colors.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/storage/secure_storage_manager.dart';
import '../widgets/profile_row_item.dart';
import '../widgets/profile_avatar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final headerColor = Theme.of(context).colorScheme.surface;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 220,
            child: Container(
              color: headerColor,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                        ),
                        onPressed: () => context.pop(),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Profile',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const ProfileAvatar(
                  imagePath: 'assets/images/user_avatar.png',
                ),
                const SizedBox(height: 16),
                Text(
                  'User1234',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 32),

                Expanded(
                  child: FutureBuilder<Map<String, String?>>(
                    future: context.read<SecureStorageManager>().getCredentials(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator(color: AppRawColors.primaryDark));
                      }

                      final email = snapshot.data?['email'] ?? 'No email saved';
                      final password = snapshot.data?['password'] ?? 'No password saved';

                      return ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          ProfileRowItem(
                            label: 'Username',
                            value: 'Username1234',
                            onTap: () {},
                          ),
                          ProfileRowItem(
                            label: 'Email',
                            value: email,
                            onTap: () {},
                          ),
                          ProfileRowItem(
                            label: 'Mobile Number',
                            value: '+1 234 567 8900',
                            onTap: () {},
                          ),
                          ProfileRowItem(
                            label: 'Password',
                            value: password,
                            onTap: () {},
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}