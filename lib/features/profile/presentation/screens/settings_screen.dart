import 'package:flutter/material.dart';
import 'package:flutter_project_2/core/helpers/responsive.dart';
import 'package:flutter_project_2/features/profile/utils/SettingsItemType.dart';
import 'package:go_router/go_router.dart';
import '../widgets/setting_row_item.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontSize: Responsive.text(context, 22),
          ),
        ),
        centerTitle: false,
        titleSpacing: 0,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.padding(context, 24),
          vertical: Responsive.padding(context, 16),
        ),
        children: SettingsItemType.values.map(
            (e) {
              return SettingRowItem(
                icon: e.getIcon(),
                title: e.getTitle(),
                trailingText: e.getTrailingText(),
                onTap: e.getOnTap,
              );
            }
        ).toList(),
      ),
    );
  }
}