class AlarmModel {
  final String id;
  final DateTime dateTime;
  final bool isActive;

  AlarmModel({required this.id, required this.dateTime, this.isActive = true});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'dateTime': dateTime.toIso8601String(),
      'isActive': isActive,
    };
  }

  factory AlarmModel.fromMap(Map<String, dynamic> map) {
    return AlarmModel(
      id: map['id'],
      dateTime: DateTime.parse(map['dateTime']),
      isActive: map['isActive'],
    );
  }
}
