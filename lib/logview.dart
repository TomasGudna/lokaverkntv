import 'package:intl/intl.dart';

import '../database/log.dart';
import '../database/log_database.dart';
import 'package:flutter/material.dart';

class LogListView extends StatefulWidget {
  const LogListView({Key? key}) : super(key: key);

  @override
  _LogListViewState createState() => _LogListViewState();
}

class _LogListViewState extends State<LogListView> {
  late Future<List<Log>> _logsFuture;

  @override
  void initState() {
    super.initState();
    _logsFuture = LogDatabase.instance.readAllLogs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: FutureBuilder<List<Log>>(
        future: _logsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Villa að finna eldri köst'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Engin köst fundust'));
          } else {
            final logs = snapshot.data!;
            return Center(
              child: ListView.builder(
                itemCount: logs.length,
                itemBuilder: (context, index) {
                  final log = logs[index];
                  final formattedDate =
                  DateFormat('dd-MM-yyyy').format(log.createdTime);
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.circular(45),
                      border: Border.all(color: Colors.white60, width: 2),
                    ),
                    child: ListTile(
                      title: Text(
                        'Log ${log.id}: ${log.nidurstada}',
                        style: TextStyle(fontSize: 18), // Adjust the font size here
                      ),
                      subtitle: Text(
                        'Kastari: ${log.kastari}\n'
                            'Gulur: ${log.yellowThrow}, Rauður: ${log.redThrow}\n'
                            'Dagur: $formattedDate',
                        style: TextStyle(fontSize: 16), // Adjust the font size here
                      ),
                      isThreeLine: true,
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
