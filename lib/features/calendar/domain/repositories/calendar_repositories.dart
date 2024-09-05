import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/model/dailly_event_model.dart'; 

abstract class CalendarRepositories {
  Future<Either<Failure, List<DaillyEventModel>>> getCalendars({
    required String month,
    required String year, 
  });
}
