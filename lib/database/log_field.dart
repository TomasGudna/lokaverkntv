import 'log_throw.dart';
import 'log_vitni.dart';
import '../classes/classes.dart';
import 'package:intl/intl.dart';

final String tableLogs = 'logs';

//final formattedDate = DateFormat('dd-MM-yyyy').format(log.createdTime);

class LogFields {
  static final List<String> values = [
    LogFieldsThrows.id,
    LogFieldsThrows.yellowThrow,
    LogFieldsThrows.redThrow,
    LogFieldsThrows.blueThrow,
    LogFieldsThrows.greenThrow,
    LogFieldsPerson.kastari,
    LogFieldsPerson.framendiVitni,
    LogFieldsPerson.bakendiVitni,
    LogFieldsPerson.kassadeildVitni,
    LogFieldsPerson.soludeildVitni,
    LogFieldsThrows.nidurstada,
    LogFieldsThrows.time
  ];
}