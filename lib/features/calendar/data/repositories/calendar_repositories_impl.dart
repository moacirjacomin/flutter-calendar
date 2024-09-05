import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/calendar_repositories.dart';
import '../data_sources/event_remote_data_source/calendar_remote_data_source.dart';
import '../model/dailly_event_model.dart';

class CalendarRepositoriesImpl implements CalendarRepositories {
  final CalendarRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  CalendarRepositoriesImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<DaillyEventModel>>> getCalendars({required String month, required String year}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.getCalendars(month: month, year: year);
        return Right(result);
      } on ServerFailure catch (e) {
        return Left(ServerFailure(message: e.message));
      } catch (e) {
        return Left(ServerFailure(message: '$e'));
      }
    } else {
      return const Left(ServerFailure(message: 'No internet connection'));
    }
  }
}
