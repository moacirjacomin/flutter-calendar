import 'package:equatable/equatable.dart';

class MedicationEntity implements Equatable {
  final String id;
  final String type;
  final String name;
  final String dosage;
  final String notes;

  MedicationEntity({
    required this.id,
    required this.type,
    required this.name,
    required this.dosage,
    required this.notes,
  });

  @override
  List<Object?> get props => [id];

  @override
  bool? get stringify => throw UnimplementedError();
}
