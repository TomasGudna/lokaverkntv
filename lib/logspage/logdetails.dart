import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../database/log.dart';
import 'package:flutter/services.dart';

class LogDetailScreen extends StatelessWidget {
  final Log log;

  const LogDetailScreen({Key? key, required this.log}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('dd-MM-yyyy').format(log.createdTime);


    String formatLog(Log log) {
      String greenThrowLine = log.greenThrow != null ? 'Grænn: ${log.greenThrow}' : '';
      String blueThrowLine = log.blueThrow != null ? 'Blár: ${log.blueThrow}' : '';

      return '''
Rúllað var: ${log.nidurstada}
Gulur: ${log.yellowThrow}
Rauður: ${log.redThrow}
${greenThrowLine.isNotEmpty ? greenThrowLine + '\n' : ''}${blueThrowLine.isNotEmpty ? blueThrowLine + '\n' : ''}Kastarinn var: ${log.kastari}
Vitni fyrir hverja skrifstofu:
• Bakendastofa - ${log.bakendiVitni}
• Framendastofa - ${log.framendiVitni}
• Kassastofa - ${log.kassadeildVitni}
• Söludeild - ${log.soludeildVitni}
''';
    }

    final formattedLog = formatLog(log);

    return Scaffold(
      appBar: AppBar(
        title: Text('Kast $formattedDate'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Log ID: ${log.id}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Rúllað var: ${log.nidurstada}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Gulur: ${log.yellowThrow}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Rauður: ${log.redThrow}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            if (log.greenThrow != null)
              Text(
                'Grænn: ${log.greenThrow}',
                style: TextStyle(fontSize: 18),
              ),
            SizedBox(height: 10),
            if (log.blueThrow != null)
              Text(
                'Blár: ${log.blueThrow}',
                style: TextStyle(fontSize: 18),
              ),
            SizedBox(height: 10),
            Text(
              'Kastarinn var: ${log.kastari}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Bakendastofa: ${log.bakendiVitni}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Framendastofa: ${log.framendiVitni}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Kassastofa: ${log.kassadeildVitni}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Söludeild: ${log.soludeildVitni}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Dagsetning: $formattedDate',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Center(
              child: TextButton(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: formattedLog));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Texti vistaður')),
                  );
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blueAccent,
                ),
                child: Text('Vista texta'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
