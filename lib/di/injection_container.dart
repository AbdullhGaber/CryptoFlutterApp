import 'package:flutter_project_2/features/market/data/network/market_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/data/data_sources/local/local_data_source_impl.dart';
import '../core/data/data_sources/remote/remote_data_source_impl.dart';
import '../core/data/repositories/repository_impl.dart';
import '../core/domain/repositories/repository.dart';
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

  sl.registerLazySingleton<LocalDataSource>(
        () => LocalDataSourceImpl(dbHelper: sl()),
  );

  sl.registerLazySingleton<RemoteDataSource>(
        () => RemoteDataSourceImpl(marketService: sl()),
  );

  sl.registerLazySingleton<Repository>(
        () => AppRepositoryImpl(
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