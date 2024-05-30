/*
import 'package:flutter/material.dart';

class LogFormWidget extends StatelessWidget {
  final int? yellowThrow;
  final int? redThrow;
  final int? greenThrow;
  final int? blueThrow;
  final String? kastari;
  final String? framendiVitni;
  final String? bakendiVitni;
  final String? kassadeildVitni;
  final String? soludeildVitni;
  final String? nidurstada;
  final ValueChanged<int> onChangedYellowThrow;
  final ValueChanged<int> onChangedRedThrow;
  final ValueChanged<int?> onChangedGreenThrow;
  final ValueChanged<int?> onChangedBlueThrow;
  final ValueChanged<String> onChangedKastari;
  final ValueChanged<String> onChangedFramendiVitni;
  final ValueChanged<String> onChangedBakendiVitni;
  final ValueChanged<String> onChangedKassadeildVitni;
  final ValueChanged<String> onChangedSoludeildVitni;
  final ValueChanged<String> onChangedNidurstada;

  const LogFormWidget({
    Key? key,
    this.yellowThrow = 0,
    this.redThrow = 0,
    this.greenThrow,
    this.blueThrow,
    this.kastari = '',
    this.framendiVitni,
    this.bakendiVitni,
    this.kassadeildVitni,
    this.soludeildVitni,
    this.nidurstada = '',
    required this.onChangedYellowThrow,
    required this.onChangedRedThrow,
    required this.onChangedGreenThrow,
    required this.onChangedBlueThrow,
    required this.onChangedKastari,
    required this.onChangedFramendiVitni,
    required this.onChangedBakendiVitni,
    required this.onChangedKassadeildVitni,
    required this.onChangedSoludeildVitni,
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
          buildFramendiVitniField(),
          const SizedBox(height: 8),
          buildBakendiVitniField(),
          const SizedBox(height: 8),
          buildKassadeildVitniField(),
          const SizedBox(height: 8),
          buildSoludeildVitniField(),
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

  Widget buildFramendiVitniField() => TextFormField(
    maxLines: 1,
    initialValue: framendiVitni,
    style: const TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    decoration: const InputDecoration(
      border: OutlineInputBorder(),
      labelText: 'Framendi Vitni',
    ),
    onChanged: onChangedFramendiVitni,
  );

  Widget buildBakendiVitniField() => TextFormField(
    maxLines: 1,
    initialValue: bakendiVitni,
    style: const TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    decoration: const InputDecoration(
      border: OutlineInputBorder(),
      labelText: 'Bakendi Vitni',
    ),
    onChanged: onChangedBakendiVitni,
  );

  Widget buildKassadeildVitniField() => TextFormField(
    maxLines: 1,
    initialValue: kassadeildVitni,
    style: const TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    decoration: const InputDecoration(
      border: OutlineInputBorder(),
      labelText: 'Kassadeild Vitni',
    ),
    onChanged: onChangedKassadeildVitni,
  );

  Widget buildSoludeildVitniField() => TextFormField(
    maxLines: 1,
    initialValue: soludeildVitni,
    style: const TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    decoration: const InputDecoration(
      border: OutlineInputBorder(),
      labelText: 'Söludeild Vitni',
    ),
    onChanged: onChangedSoludeildVitni,
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


 */

