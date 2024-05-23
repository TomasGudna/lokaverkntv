import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../database/log.dart';
import '../database/log_database.dart';
import 'eldri_kost_edit.dart';
import 'eldri_kost_skodun.dart';
import 'eldri_kost_card.dart';
import 'eldri_kost_form.dart';

class LogsPage extends StatefulWidget {
  const LogsPage({Key? key}) : super(key: key);

  @override
  State<LogsPage> createState() => _LogsPageState();
}

class _LogsPageState extends State<LogsPage> {
  late List<Log> logs;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshLogs();
  }

  @override
  void dispose() {
    LogDatabase.instance.close();

    super.dispose();
  }

  Future refreshLogs() async {
    setState(() => isLoading = true);

    logs = await LogDatabase.instance.readAllLogs();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text(
        'Logs',
        style: TextStyle(fontSize: 24),
      ),
      actions: const [Icon(Icons.search), SizedBox(width: 12)],
    ),
    body: Center(
      child: isLoading
          ? const CircularProgressIndicator()
          : logs.isEmpty
          ? const Text(
        'No Logs',
        style: TextStyle(color: Colors.white, fontSize: 24),
      )
          : buildLogs(),
    ),
    floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.black,
      child: const Icon(Icons.add),
      onPressed: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const AddEditLogPage()),
        );

        refreshLogs();
      },
    ),
  );

  Widget buildLogs() => StaggeredGrid.count(
    crossAxisCount: 2,
    mainAxisSpacing: 2,
    crossAxisSpacing: 2,
    children: List.generate(
      logs.length,
          (index) {
        final log = logs[index];

        return StaggeredGridTile.fit(
          crossAxisCellCount: 1,
          child: GestureDetector(
            onTap: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => LogDetailPage(logId: log.id!),
              ));

              refreshLogs();
            },
            child: LogCardWidget(log: log, index: index),
          ),
        );
      },
    ),
  );
}