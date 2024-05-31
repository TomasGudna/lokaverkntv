import 'package:flutter/material.dart';
import 'package:lokaverk/classes/classes.dart';
import 'vitni_takki.dart';


class Vitni extends StatefulWidget {
  final Function(VitniObject) updateParentState;

  Vitni({required this.updateParentState});

  @override
  State<Vitni> createState() => _VitniState();
}

class _VitniState extends State<Vitni> {
  String selectedButton = '';
  int? selectedOptionIndex;
  VitniObject vitniObject = VitniObject();

  void _showOptions(BuildContext context) {
    List<String> options = buttonOptions[selectedButton] ?? [];
    List<bool> selectedOptions = List<bool>.filled(options.length, false);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text('Vitni úr $selectedButton'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (var i = 0; i < options.length; i++)
                      CheckboxListTile(
                        title: Text(options[i]),
                        value: selectedOptions[i],
                        onChanged: (value) {
                          setState(() {
                            selectedOptions[i] = value!;
                          });
                        },
                      )
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Vista'),
                  onPressed: () {
                    String selectedVitni = options
                        .asMap()
                        .entries
                        .where((entry) => selectedOptions[entry.key])
                        .map((entry) => entry.value)
                        .join(', ');

                    switch (selectedButton) {
                      case 'Framendi':
                        vitniObject.framendiVitni = selectedVitni;
                        break;
                      case 'Bakendi':
                        vitniObject.bakendiVitni = selectedVitni;
                        break;
                      case 'Kassadeild':
                        vitniObject.kassadeildVitni = selectedVitni;
                        break;
                      case 'Söludeild':
                        vitniObject.soludeildVitni = selectedVitni;
                        break;
                    }

                    widget.updateParentState(vitniObject);
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Hætta við'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showAllOptions(BuildContext context) {
    List<String> allNames =
        _getAllNames().where((name) => name != 'HERESY').toList();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: const Text('Kastari:'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (var i = 0; i < allNames.length; i++)
                      RadioListTile<int>(
                        title: Text(allNames[i]),
                        value: i,
                        groupValue: selectedOptionIndex,
                        onChanged: (int? value) {
                          setState(() {
                            selectedOptionIndex = value;
                          });
                        },
                      )
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Vista'),
                  onPressed: () {
                    if (selectedOptionIndex != null) {
                      vitniObject.kastari = allNames[selectedOptionIndex!];
                      widget.updateParentState(vitniObject);
                    }
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Hætta við'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  List<String> _getAllNames() {
    return buttonOptions.values.expand((list) => list).toList();
  }

  final Map<String, List<String>> buttonOptions = {
    'Bakendi': ['Arnar', 'Þröstur', 'Engilbert', 'HERESY'],
    'Framendi': ['Grímur', 'Marzúk', 'Fannar', 'HERESY'],
    'Kassadeild': ['Tómas', 'Þór', 'Kormákur', 'Sveinn', 'HERESY'],
    'Söludeild': ['Sara', 'Federica', 'Gunnar', 'HERESY'],
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: VitniTakki(
            buttonText: 'Kastari',
            onPressed: () {
              setState(() {
                selectedButton = 'Kastari';
                selectedOptionIndex = null;
              });
              _showAllOptions(context);
            },
          ),
        ),
        const SizedBox(height: 1),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            VitniTakki(
              buttonText: 'Framendi',
              onPressed: () {
                setState(() {
                  selectedButton = 'Framendi';
                });
                _showOptions(context);
              },
            ),
            VitniTakki(
              buttonText: 'Bakendi',
              onPressed: () {
                setState(() {
                  selectedButton = 'Bakendi';
                });
                _showOptions(context);
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            VitniTakki(
              buttonText: 'Kassadeild',
              onPressed: () {
                setState(() {
                  selectedButton = 'Kassadeild';
                });
                _showOptions(context);
              },
            ),
            VitniTakki(
              buttonText: 'Söludeild',
              onPressed: () {
                setState(() {
                  selectedButton = 'Söludeild';
                });
                _showOptions(context);
              },
            ),
          ],
        ),
      ],
    );
  }
}
