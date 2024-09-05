import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/network/network_info.dart';
 
 
import 'features/calendar/data/data_sources/event_remote_data_source/calendar_remote_data_source.dart';
import 'features/calendar/data/data_sources/event_remote_data_source/calendar_remote_data_source_impl.dart';
import 'features/calendar/data/repositories/calendar_repositories_impl.dart';
import 'features/calendar/domain/repositories/calendar_repositories.dart';
import 'features/calendar/domain/usecases/get_all_events_usecase.dart';
import 'features/calendar/presentation/bloc/calendar_main_cubit.dart'; 

final sl = GetIt.instance;

void init() async {
  // register repository
  sl.registerLazySingleton<CalendarRepositories>(() => CalendarRepositoriesImpl(remoteDataSource: sl(), networkInfo: sl()));

  // register datasource
  sl.registerLazySingleton<CalendarRemoteDataSource>(() => CalendarRemoteDataSourceImpl(client: sl()));

  // register usecase
  sl.registerLazySingleton(() => GetMonthEventsUsecase(sl())); 

  // register bloc
  sl.registerFactory(() => CalendarMainCubit(sl()));

  // register network info
  sl.registerLazySingleton<http.Client>(() => http.Client());
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      InternetConnectionChecker(),
    ),
  );
}
