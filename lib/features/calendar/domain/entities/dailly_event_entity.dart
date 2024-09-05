import 'package:equatable/equatable.dart';

import '../../data/model/medication_model.dart';

class DaillyEventEntity extends Equatable {
  final String id;
  final String date;
  final bool isTaken;
  final MedicationModel medication;

  const DaillyEventEntity(this.id, this.date, this.isTaken, this.medication);

  @override
  List<Object?> get props => [id, date];
}
