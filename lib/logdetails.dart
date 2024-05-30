import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../database/log_database.dart';
import 'logview.dart';
import '../database/log.dart';

class LogDetailScreen extends StatelessWidget {
  final Log log;

  const LogDetailScreen({Key? key, required this.log}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('dd-MM-yyyy').format(log.createdTime);

    return Scaffold(
      appBar: AppBar(
        title: Text('Log Details'),
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
              'Nidurstada: ${log.nidurstada}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Kastari: ${log.kastari}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Yellow Throw: ${log.yellowThrow}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Red Throw: ${log.redThrow}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Created Date: $formattedDate',
              style: TextStyle(fontSize: 18),
            ),
            // Add more Text widgets to display other log details if needed
          ],
        ),
      ),
    );
  }
}