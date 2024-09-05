// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/constants/status.dart';
import '../../../../core/error/failures.dart';
import '../../data/model/dailly_event_model.dart';
import '../../domain/usecases/get_all_events_usecase.dart';

part 'calendar_main_state.dart';

class CalendarMainCubit extends Cubit<CalendarMainState> {
  final GetMonthEventsUsecase getEventsUsecase;
  CalendarMainCubit(
    this.getEventsUsecase,
  ) : super(const CalendarMainState());

  void init() async {
    GetMonthEvents();
 
  }

  Future GetMonthEvents() async {
    emit(state.copyWith(status: Status.loading));
    final result = await getEventsUsecase(
      month: '09',
      year: '2034', 
    );

     

    result.fold(
      (failure) {
        print('... BLOC GetMonthEvents error: ${failure}');
        emit(state.copyWith(status: Status.failure, failure: failure, errorMessage: failure.message));
      },
      (monthDaillyEventList) {
        print('... BLOC GetMonthEvents results: ${monthDaillyEventList}');
        emit(state.copyWith(status: Status.success, daillyEvents: monthDaillyEventList));
      },
    );
  }
 
}
