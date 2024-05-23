import 'package:flutter/material.dart';
import '../database/log_database.dart';
import '../database/log.dart';
import 'eldri_kost_card.dart';
import 'eldri_kost_form.dart';


class AddEditLogPage extends StatefulWidget {
  final Log? log;

  const AddEditLogPage({
    Key? key,
    this.log,
  }) : super(key: key);

  @override
  State<AddEditLogPage> createState() => _AddEditLogPageState();
}

class _AddEditLogPageState extends State<AddEditLogPage> {
  final _formKey = GlobalKey<FormState>();
  late int yellowThrow;
  late int redThrow;
  late int? greenThrow;
  late int? blueThrow;
  late String kastari;
  late String vitni;
  late String nidurstada;
  late DateTime createdTime;

  @override
  void initState() {
    super.initState();

    yellowThrow = widget.log?.yellowThrow ?? 0;
    redThrow = widget.log?.redThrow ?? 0;
    greenThrow = widget.log?.greenThrow ?? null;
    blueThrow = widget.log?.blueThrow ?? null;
    kastari = widget.log?.kastari ?? '';
    vitni = widget.log?.vitni ?? '';
    nidurstada = widget.log?.nidurstada ?? '';
    createdTime = widget.log?.createdTime ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      actions: [buildButton()],
    ),
    body: Form(
      key: _formKey,
      child: LogFormWidget(
        yellowThrow: yellowThrow,
        redThrow: redThrow,
        greenThrow: greenThrow,
        blueThrow: blueThrow,
        kastari: kastari,
        vitni: vitni,
        nidurstada: nidurstada,
        onChangedYellowThrow: (yellowThrow) => setState(() => this.yellowThrow = yellowThrow),
        onChangedRedThrow: (redThrow) => setState(() => this.redThrow = redThrow),
        onChangedGreenThrow: (greenThrow) => setState(() => this.greenThrow = greenThrow),
        onChangedBlueThrow: (blueThrow) => setState(() => this.blueThrow = blueThrow),
        onChangedKastari: (kastari) => setState(() => this.kastari = kastari),
        onChangedVitni: (vitni) => setState(() => this.vitni = vitni),
        onChangedNidurstada: (nidurstada) => setState(() => this.nidurstada = nidurstada),
      ),
    ),
  );

  Widget buildButton() {
    final isFormValid = kastari.isNotEmpty && vitni.isNotEmpty && nidurstada.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: isFormValid ? null : Colors.grey.shade700,
        ),
        onPressed: addOrUpdateLog,
        child: const Text('Save'),
      ),
    );
  }

  void addOrUpdateLog() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.log != null;

      if (isUpdating) {
        await updateLog();
      } else {
        await addLog();
      }

      Navigator.of(context).pop();
    }
  }

  Future updateLog() async {
    final log = widget.log!.copy(
      yellowThrow: yellowThrow,
      redThrow: redThrow,
      greenThrow: greenThrow,
      blueThrow: blueThrow,
      kastari: kastari,
      vitni: vitni,
      nidurstada: nidurstada,
      createdTime: createdTime,
    );

    await LogDatabase.instance.update(log);
  }

  Future addLog() async {
    final log = Log(
      yellowThrow: yellowThrow,
      redThrow: redThrow,
      greenThrow: greenThrow,
      blueThrow: blueThrow,
      kastari: kastari,
      vitni: vitni,
      nidurstada: nidurstada,
      createdTime: DateTime.now(),
    );

    await LogDatabase.instance.create(log);
  }
}