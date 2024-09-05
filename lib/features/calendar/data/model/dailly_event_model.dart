import 'dart:convert'; 
import '../../domain/entities/dailly_event_entity.dart';
import 'medication_model.dart';

class DaillyEventModel extends DaillyEventEntity {
  const DaillyEventModel(
    super.id,
    super.date,
    super.isTaken,
    super.medication,
  );


  @override
  String toString() {
    return 'DaillyEventModel(id: $id, date: $date, isTaken: $isTaken, medication: $medication)';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'isTaken': isTaken,
      'medication': medication.toMap(),
    };
  }

  factory DaillyEventModel.fromMap(Map<String, dynamic> map) {
    return DaillyEventModel(
      map['id'] ?? '',
      map['date'] ?? '',
      map['isTaken'] ?? false,
      MedicationModel.fromMap(map['medication']),
    );
  }

  String toJson() => json.encode(toMap());

  factory DaillyEventModel.fromJson(String source) => DaillyEventModel.fromMap(json.decode(source));

  static List<DaillyEventModel> fromJsonList(List<dynamic> json) {
    var list = <DaillyEventModel>[];

    if (json.isNotEmpty) {
      list = json.map<DaillyEventModel>((jsomItem) => DaillyEventModel.fromMap(jsomItem)).toList();
    }

    return list;
  }
}
