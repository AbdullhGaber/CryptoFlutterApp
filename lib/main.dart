import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_2/core/routing/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/market/presentation/bloc/market_bloc.dart';
import 'di/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(
    const TMinus1App(),
  );
}

class TMinus1App extends StatelessWidget {
  const TMinus1App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<MarketBloc>(),
      child:MaterialApp.router(
        title: 'tMinus1',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: AppTheme.darkTheme,
        routerConfig: AppRouter.router,
      ) ,
    );
  }
}