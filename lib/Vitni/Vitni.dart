import 'package:flutter/material.dart';
import 'vitni_takki.dart';

class Vitni extends StatefulWidget {
  const Vitni({Key? key}) : super(key: key);

  @override
  _Vitni createState() => _Vitni();
}

class _Vitni extends State<Vitni> {
  String selectedButton = '';
  int? selectedOptionIndex;
  List<bool> selectedOptions = [];

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
                  selectedOptions = List<bool>.filled(3, false);
                });
                _showOptions(context);
              },
            ),
            VitniTakki(
              buttonText: 'Bakendi',
              onPressed: () {
                setState(() {
                  selectedButton = 'Bakendi';
                  selectedOptions = List<bool>.filled(3, false);
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
                  selectedOptions = List<bool>.filled(3, false);
                });
                _showOptions(context);
              },
            ),
            VitniTakki(
              buttonText: 'Söludeild',
              onPressed: () {
                setState(() {
                  selectedButton = 'Söludeild';
                  selectedOptions = List<bool>.filled(3, false);
                });
                _showOptions(context);
              },
            ),
          ],
        ),
      ],
    );
  }

  void _showOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        List<String> options = buttonOptions[selectedButton] ?? [];
        List<bool> selectedOptions = List<bool>.filled(options.length, false);

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
                    // Bæta við til að vista
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
    List<String> allNames = _getAllNames();
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
                    // Bæta við til að vista
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
    'Bakendi': ['Arnar', 'Þröstur', 'Engilbert'],
    'Framendi': ['Grímur', 'Marzúk', 'Fannar'],
    'Kassadeild': ['Tómas', 'Þór', 'Kormákur', 'Sveinn'],
    'Söludeild': ['Sara', 'Federica', 'Gunnar'],
  };
}
