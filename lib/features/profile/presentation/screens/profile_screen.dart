import 'package:flutter/material.dart';
import 'package:flutter_project_2/core/theme/styles/app_colors.dart';
import 'package:flutter_project_2/core/helpers/responsive.dart';
import 'package:flutter_project_2/core/helpers/extensions.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/storage/secure_storage_manager.dart';
import '../widgets/profile_avatar.dart';
import '../widgets/profile_row_item.dart';
import '../../../../core/localization/loc.dart';

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
            height: context.screenHeight * 0.26,
            child: Container(
              color: headerColor,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Responsive.padding(context, 8),
                    vertical: Responsive.padding(context, 8),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                        ),
                        onPressed: () => context.pop(),
                      ),
                      SizedBox(width: Responsive.value(context, 8)),
                      Text(
                        Loc.profile.profile,
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontSize: Responsive.text(context, 22),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Responsive.value(context, 16)),
                const ProfileAvatar(
                  imagePath: 'assets/images/user_avatar.png',
                ),
                SizedBox(height: Responsive.value(context, 16)),
                Text(
                  'User1234',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: Responsive.text(context, 20),
                  ),
                ),
                SizedBox(height: Responsive.value(context, 32)),

                Expanded(
                  child: FutureBuilder<Map<String, String?>>(
                    future: context.read<SecureStorageManager>().getCredentials(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator(color: AppRawColors.primaryDark));
                      }

                      final email = snapshot.data?['email'] ?? Loc.profile.noEmailSaved;
                      final password = snapshot.data?['password'] ?? Loc.profile.noPasswordSaved;

                      return ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          ProfileRowItem(
                            label: Loc.profile.username,
                            value: 'Username1234',
                            onTap: () {},
                          ),
                          ProfileRowItem(
                            label: Loc.profile.email,
                            value: email,
                            onTap: () {},
                          ),
                          ProfileRowItem(
                            label: Loc.profile.mobileNumber,
                            value: '+1 234 567 8900',
                            onTap: () {},
                          ),
                          ProfileRowItem(
                            label: Loc.profile.password,
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