import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_2/core/routing/app_router.dart';
import 'package:flutter_project_2/core/theme/mode/cubit/theme_cubit.dart';
import 'package:flutter_project_2/core/theme/mode/cubit/theme_states.dart';
import 'features/market/presentation/cubit/market_cubit.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => di.sl<MarketCubit>()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeStates>(
        builder: (context, state) {
          final themeCubit = context.read<ThemeCubit>();
          return MaterialApp.router(
            title: 'tMinus1',
            debugShowCheckedModeBanner: false,
            theme: themeCubit.themeData,
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}