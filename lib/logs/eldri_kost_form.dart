import 'package:flutter/material.dart';

class LogFormWidget extends StatelessWidget {
  final int? yellowThrow;
  final int? redThrow;
  final int? greenThrow;
  final int? blueThrow;
  final String? kastari;
  final String? vitni;
  final String? nidurstada;
  final ValueChanged<int> onChangedYellowThrow;
  final ValueChanged<int> onChangedRedThrow;
  final ValueChanged<int?> onChangedGreenThrow;
  final ValueChanged<int?> onChangedBlueThrow;
  final ValueChanged<String> onChangedKastari;
  final ValueChanged<String> onChangedVitni;
  final ValueChanged<String> onChangedNidurstada;

  const LogFormWidget({
    Key? key,
    this.yellowThrow = 0,
    this.redThrow = 0,
    this.greenThrow,
    this.blueThrow,
    this.kastari = '',
    this.vitni = '',
    this.nidurstada = '',
    required this.onChangedYellowThrow,
    required this.onChangedRedThrow,
    required this.onChangedGreenThrow,
    required this.onChangedBlueThrow,
    required this.onChangedKastari,
    required this.onChangedVitni,
    required this.onChangedNidurstada,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildThrowField('Yellow Throw', yellowThrow, onChangedYellowThrow),
          const SizedBox(height: 8),
          buildThrowField('Red Throw', redThrow, onChangedRedThrow),
          const SizedBox(height: 8),
          buildOptionalThrowField('Green Throw', greenThrow, onChangedGreenThrow),
          const SizedBox(height: 8),
          buildOptionalThrowField('Blue Throw', blueThrow, onChangedBlueThrow),
          const SizedBox(height: 8),
          buildKastariField(),
          const SizedBox(height: 8),
          buildVitniField(),
          const SizedBox(height: 8),
          buildNidurstadaField(),
          const SizedBox(height: 16),
        ],
      ),
    ),
  );

  Widget buildThrowField(String label, int? value, ValueChanged<int> onChanged) => Row(
    children: [
      Text(label),
      Expanded(
        child: Slider(
          value: (value ?? 0).toDouble(),
          min: 0,
          max: 6, // Adjust max value as needed
          divisions: 100,
          label: value?.toString(),
          onChanged: (value) => onChanged(value.toInt()),
        ),
      ),
    ],
  );

  Widget buildOptionalThrowField(String label, int? value, ValueChanged<int?> onChanged) => Row(
    children: [
      Text(label),
      Expanded(
        child: Slider(
          value: (value ?? 0).toDouble(),
          min: 0,
          max: 6, // Adjust max value as needed
          divisions: 100,
          label: value?.toString(),
          onChanged: (value) => onChanged(value == 0 ? null : value.toInt()),
        ),
      ),
    ],
  );

  Widget buildKastariField() => TextFormField(
    maxLines: 1,
    initialValue: kastari,
    style: const TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    decoration: const InputDecoration(
      border: OutlineInputBorder(),
      labelText: 'Kastari',
    ),
    validator: (value) =>
    value != null && value.isEmpty ? 'Vantar að velja kastara' : null,
    onChanged: onChangedKastari,
  );

  Widget buildVitniField() => TextFormField(
    maxLines: 1,
    initialValue: vitni,
    style: const TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    decoration: const InputDecoration(
      border: OutlineInputBorder(),
      labelText: 'Vitni',
    ),
    validator: (value) =>
    value != null && value.isEmpty ? 'Vantar að velja vitni' : null,
    onChanged: onChangedVitni,
  );

  Widget buildNidurstadaField() => TextFormField(
    maxLines: 3,
    initialValue: nidurstada,
    style: const TextStyle(color: Colors.black54, fontSize: 18),
    decoration: const InputDecoration(
      border: OutlineInputBorder(),
      labelText: 'Nidurstada',
    ),
    validator: (value) =>
    value != null && value.isEmpty ? 'Vantar niðurstöðu' : null,
    onChanged: onChangedNidurstada,
  );
}
