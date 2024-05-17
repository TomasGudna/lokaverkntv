final String tableLogs = 'logs';

class LogFields {
  static final List<String> values = [
    id, yellowThrow, redThrow, blueThrow, greenThrow, kastari, vitni, nidurstada, time
  ];



  static final String id = '_id';
  static final String yellowThrow = 'yellow';
  static final String redThrow = 'red';
  static final String greenThrow = 'green';
  static final String blueThrow = 'blue';
  static final String kastari = 'kastari';
  static final String vitni = 'vitni';
  static final String nidurstada = 'nidurstada';
  static final String time = 'dagsetning';

}

class Log {
  final int? id;
  final int yellowThrow;
  final int redThrow;
  final int? greenThrow;
  final int? blueThrow;
  final String kastari;
  final String vitni;
  final String nidurstada;
  final DateTime createdTime;


  const Log({
    this.id,
    required this.yellowThrow,
    required this.redThrow,
    this.greenThrow,
    this.blueThrow,
    required this.kastari,
    required this.vitni,
    required this.nidurstada,
    required this.createdTime
  });

  Log copy({
   int? id,
     int? yellowThrow,
     int? redThrow,
    int? greenThrow,
    int? blueThrow,
     String? kastari,
     String? vitni,
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
        vitni: vitni ?? this.vitni,
        nidurstada: nidurstada ?? this.nidurstada,
        createdTime: createdTime ?? this.createdTime
      );

  static Log fromJson(Map<String, Object?> json) => Log(
      id: json[LogFields.id] as int?,
      yellowThrow: json[LogFields.yellowThrow] as int,
    redThrow: json[LogFields.redThrow] as int,
    greenThrow: json[LogFields.greenThrow] as int,
    blueThrow: json[LogFields.blueThrow] as int,
    kastari: json[LogFields.kastari] as String,
    vitni: json[LogFields.vitni] as String,
    nidurstada: json[LogFields.nidurstada] as String,
    createdTime: DateTime.parse(json[LogFields.time] as String)
  );

  Map<String, Object?> toJson() => {
    LogFields.id: id,
    LogFields.yellowThrow: yellowThrow,
    LogFields.redThrow: redThrow,
    LogFields.greenThrow: greenThrow,
    LogFields.blueThrow: blueThrow,
    LogFields.kastari: kastari,
    LogFields.vitni: vitni,
    LogFields.nidurstada: nidurstada,
    LogFields.time: createdTime.toIso8601String(),

  };
}