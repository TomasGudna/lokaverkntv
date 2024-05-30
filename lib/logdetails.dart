import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../database/log.dart';

class LogDetailScreen extends StatelessWidget {
  final Log log;

  const LogDetailScreen({Key? key, required this.log}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('dd-MM-yyyy').format(log.createdTime);

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
            // Add more Text widgets to display other log details if needed
          ],
        ),
      ),
    );
  }
}