 

import '../../model/dailly_event_model.dart';

abstract class CalendarRemoteDataSource {
  Future<List<DaillyEventModel>> getCalendars({required String month, required String year});
}
