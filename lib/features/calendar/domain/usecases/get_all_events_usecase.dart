import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/model/dailly_event_model.dart';
import '../repositories/calendar_repositories.dart';

class GetMonthEventsUsecase {
  final CalendarRepositories repository;

  GetMonthEventsUsecase(this.repository);

  Future<Either<Failure, List<DaillyEventModel>>> call({
    required String month,
    required String year, 
  }) async {
    return await repository.getCalendars(
      month: month,
      year: year, 
    );
  }
}
