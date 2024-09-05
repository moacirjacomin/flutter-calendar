import 'dart:convert';

import '../../domain/entities/medication_entity.dart';

class MedicationModel extends MedicationEntity {
  MedicationModel({
    required super.id,
    required super.type,
    required super.name,
    required super.dosage,
    required super.notes,
  });

  
  @override 
  bool? get stringify => throw UnimplementedError();

  @override
  String toString() {
    return 'MedicationModel(id: $id, type: $type, name: $name, dosage: $dosage, notes: $notes)';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'name': name,
      'dosage': dosage,
      'notes': notes,
    };
  }

  factory MedicationModel.fromMap(Map<String, dynamic> map) {
    return MedicationModel(
      id: map['id'] ?? '',
      type: map['type'] ?? '',
      name: map['name'] ?? '',
      dosage: map['dosage'] ?? '',
      notes: map['notes'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MedicationModel.fromJson(String source) => MedicationModel.fromMap(json.decode(source));

    static List<MedicationModel> fromJsonList(List<dynamic> json) {
    var list = <MedicationModel>[];

    if (json.isNotEmpty) {
      list = json.map<MedicationModel>((jsomItem) => MedicationModel.fromMap(jsomItem)).toList();
    }

    return list;
  }
}
