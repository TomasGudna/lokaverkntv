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
    print(1);
    _logsFuture = LogDatabase.instance.readAllLogs();

    print(2);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Log>>(
        future: _logsFuture,
        builder: (context, snapshot) {
          print(_logsFuture.toString());
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print(snapshot.error.toString());
            return const Center(child: Text('Error loading logs'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No logs found'));
          } else {
            final logs = snapshot.data!;
            return ListView.builder(
              itemCount: logs.length,
              itemBuilder: (context, index) {
                final log = logs[index];
                return ListTile(
                  title: Text('Log ${log.id}: ${log.nidurstada}'),
                  subtitle: Text(
                    'Kastari: ${log.kastari}\n'
                        'Yellow Throw: ${log.yellowThrow}, Red Throw: ${log.redThrow}',
                  ),
                  isThreeLine: true,
                );
              },
            );
          }
        },
      ),
    );
  }
}