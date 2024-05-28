import 'log_vitni.dart';
import 'log_throw.dart';
import 'log_field.dart';

class Log {
  final int? id;
  final int yellowThrow;
  final int redThrow;
  final int? greenThrow;
  final int? blueThrow;
  final String kastari;
  final String framendiVitni;
  final String bakendiVitni;
  final String kassadeildVitni;
  final String soludeildVitni;
  final String nidurstada;
  final DateTime createdTime;

  const Log({
    this.id,
    required this.yellowThrow,
    required this.redThrow,
    this.greenThrow,
    this.blueThrow,
    required this.kastari,
    required this.framendiVitni,
    required this.bakendiVitni,
    required this.kassadeildVitni,
    required this.soludeildVitni,
    required this.nidurstada,
    required this.createdTime,
  });

  Log copy({
    int? id,
    int? yellowThrow,
    int? redThrow,
    int? greenThrow,
    int? blueThrow,
    String? kastari,
    String? framendiVitni,
    String? bakendiVitni,
    String? kassadeildVitni,
    String? soludeildVitni,
    String? nidurstada,
    DateTime? createdTime,
  }) =>
      Log(
        id: id ?? this.id,
        yellowThrow: yellowThrow ?? this.yellowThrow,
        redThrow: redThrow ?? this.redThrow,
        greenThrow: greenThrow ?? this.greenThrow,
        blueThrow: blueThrow ?? this.blueThrow,
        kastari: kastari ?? this.kastari,
        framendiVitni: framendiVitni ?? this.framendiVitni,
        bakendiVitni: bakendiVitni ?? this.bakendiVitni,
        kassadeildVitni: kassadeildVitni ?? this.kassadeildVitni,
        soludeildVitni: soludeildVitni ?? this.soludeildVitni,
        nidurstada: nidurstada ?? this.nidurstada,
        createdTime: createdTime ?? this.createdTime,
      );

  static Log fromJson(Map<String, Object?> json) => Log(
    id: json[LogFieldsThrows.id] as int?,
    yellowThrow: json[LogFieldsThrows.yellowThrow] as int,
    redThrow: json[LogFieldsThrows.redThrow] as int,
    greenThrow: json[LogFieldsThrows.greenThrow] as int,
    blueThrow: json[LogFieldsThrows.blueThrow] as int,
    kastari: json[LogFieldsPerson.kastari] as String,
    framendiVitni: json[LogFieldsPerson.framendiVitni] as String,
    bakendiVitni: json[LogFieldsPerson.bakendiVitni] as String,
    kassadeildVitni: json[LogFieldsPerson.kassadeildVitni] as String,
    soludeildVitni: json[LogFieldsPerson.soludeildVitni] as String,
    nidurstada: json[LogFieldsThrows.nidurstada] as String,
    createdTime: DateTime.parse(json[LogFieldsThrows.time] as String),
  );

  Map<String, Object?> toJson() => {
    LogFieldsThrows.id: id,
    LogFieldsThrows.yellowThrow: yellowThrow,
    LogFieldsThrows.redThrow: redThrow,
    LogFieldsThrows.greenThrow: greenThrow,
    LogFieldsThrows.blueThrow: blueThrow,
    LogFieldsPerson.kastari: kastari,
    LogFieldsPerson.framendiVitni: framendiVitni,
    LogFieldsPerson.bakendiVitni: bakendiVitni,
    LogFieldsPerson.kassadeildVitni: kassadeildVitni,
    LogFieldsPerson.soludeildVitni: soludeildVitni,
    LogFieldsThrows.nidurstada: nidurstada,
    LogFieldsThrows.time: createdTime.toIso8601String(),
  };
}