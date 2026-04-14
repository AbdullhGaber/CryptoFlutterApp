import 'package:flutter_project_2/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter_project_2/features/market/data/data_sources/market_local_data_source.dart';
import 'package:flutter_project_2/features/market/data/data_sources/market_remote_data_source.dart';
import 'package:flutter_project_2/features/market/data/repositories/market_repository_impl.dart';
import 'package:flutter_project_2/features/market/data/network/market_service.dart';
import 'package:flutter_project_2/features/market/domain/repositories/market_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/network/dio_client.dart';
import '../core/storage/database_helper.dart';
import '../core/storage/secure_storage_manager.dart';
import '../core/storage/shared_prefs_manager.dart';
import '../features/market/presentation/cubit/market_cubit.dart';

// Localization
import '../core/localization/values/loc_app.dart';
import '../core/localization/values/loc_auth.dart';
import '../core/localization/values/loc_home.dart';
import '../core/localization/values/loc_market.dart';
import '../core/localization/values/loc_onboarding.dart';
import '../core/localization/values/loc_wallet.dart';
import '../core/localization/values/loc_activity.dart';
import '../core/localization/values/loc_profile.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // ── Localization ──
  sl.registerLazySingleton(() => AppLoc());
  sl.registerLazySingleton(() => AuthLoc());
  sl.registerLazySingleton(() => OnboardingLoc());
  sl.registerLazySingleton(() => HomeLoc());
  sl.registerLazySingleton(() => MarketLoc());
  sl.registerLazySingleton(() => WalletLoc());
  sl.registerLazySingleton(() => ActivityLoc());
  sl.registerLazySingleton(() => ProfileLoc());

  // ── Storage ──
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  sl.registerLazySingleton(() => SharedPrefsManager(sl()));
  sl.registerLazySingleton(() => SecureStorageManager());
  sl.registerLazySingleton(() => MarketService(DioClient()));

  final databaseHelper = DatabaseHelper();
  await databaseHelper.database;
  sl.registerLazySingleton(() => databaseHelper);

  sl.registerLazySingleton<MarketLocalDataSource>(
    () => MarketLocalDataSourceImpl(dbHelper: sl()),
  );

  sl.registerLazySingleton<MarketRemoteDataSource>(
    () => MarketRemoteDataSourceImpl(marketService: sl()),
  );

  sl.registerLazySingleton<MarketRepository>(
    () => MarketRepositoryImpl(remoteDataSource: sl(), localDataSource: sl()),
  );

  sl.registerFactory(() => MarketCubit(repository: sl()));

  sl.registerFactory(() => HomeCubit(marketRepository: sl()));
}
