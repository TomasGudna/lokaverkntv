
/*

class LogDetailPage extends StatefulWidget {
  final int logId;

  const LogDetailPage({
    Key? key,
    required this.logId,
  }) : super(key: key);

  @override
  _LogDetailPageState createState() => _LogDetailPageState();
}

class _LogDetailPageState extends State<LogDetailPage> {
  late Log log;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshLog();
  }

  Future refreshLog() async {
    setState(() => isLoading = true);

    log = await LogDatabase.instance.readLog(widget.logId);

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      actions: [
        IconButton(
          icon: Icon(Icons.edit),
          onPressed: () async {
            if (isLoading) return;

            await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddEditLogPage(log: log),
            ));

            refreshLog();
          },
        ),
        IconButton(
          icon: Icon(Icons.delete),
          onPressed: () async {
            await LogDatabase.instance.delete(widget.logId);

            Navigator.of(context).pop();
          },
        ),
      ],
    ),
    body: isLoading
        ? Center(child: CircularProgressIndicator())
        : Padding(
      padding: EdgeInsets.all(12),
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 8),
        children: [
          Text(
            log.kastari,
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            log.framendiVitni,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 8),
          Text(
            log.bakendiVitni,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 8),
          Text(
            log.kassadeildVitni,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 8),
          Text(
            log.soludeildVitni,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Yellow Throws: ${log.yellowThrow}',
            style: TextStyle(fontSize: 18),
          ),
          Text(
            'Red Throws: ${log.redThrow}',
            style: TextStyle(fontSize: 18),
          ),
          Text(
            'Green Throws: ${log.greenThrow ?? 0}',
            style: TextStyle(fontSize: 18),
          ),
          Text(
            'Blue Throws: ${log.blueThrow ?? 0}',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            log.nidurstada,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    ),
  );
}

 */