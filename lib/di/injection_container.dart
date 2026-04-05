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
import '../features/market/presentation/bloc/market_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
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
        () => MarketRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
    ),
  );

  sl.registerFactory(
        () => MarketBloc(
      repository: sl(),
    ),
  );
}