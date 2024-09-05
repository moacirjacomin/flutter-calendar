part of 'calendar_main_cubit.dart';

class CalendarMainState extends Equatable {
  final Status status;
  final Failure? failure;
  final String? errorMessage;
  final List<DaillyEventModel> daillyEvents; 

  const CalendarMainState({
    this.status = Status.initial,
    this.failure,
    this.errorMessage = '',
    this.daillyEvents = const [], 
  });

  @override
  List<Object?> get props => [
        status,
        failure,
        errorMessage,
        daillyEvents, 
      ];

  CalendarMainState copyWith({
    Status? status,
    Failure? failure,
    String? errorMessage,
    List<DaillyEventModel>? daillyEvents, 
  }) {
    return CalendarMainState(
      status: status ?? this.status,
      failure: failure ?? this.failure,
      errorMessage: errorMessage ?? this.errorMessage,
      daillyEvents: daillyEvents ?? this.daillyEvents, 
    );
  }
}
