import 'package:flutter/material.dart';


class Vitni extends StatefulWidget {
  @override
  _Vitni createState() => _Vitni();
}

class _Vitni extends State<Vitni> {
  String selectedButton = '';
  List<bool> selectedOptions = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
            children: [
              GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                shrinkWrap: true,
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
          ),
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
              content: Column(
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
              actions: <Widget>[
                TextButton(
                  child: Text('Vista'),
                  onPressed: () {
                    //Bæta við til að vista
                  },
                ),
                TextButton(
                  child: Text('Hætta við'),
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

  final Map<String, List<String>> buttonOptions = {
    'Framendi': ['Arnar', 'Þröstur', 'Engilbert'],
    'Bakendi': ['Grímur', 'Marzúk', 'Fannar'],
    'Kassadeild': ['Tómas', 'Þór', 'Kormákur', 'Sveinn'],
    'Söludeild': ['Sara', 'Federica', 'Gunnar'],
  };
}

class VitniTakki extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  VitniTakki({required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: ElevatedButton(
          onPressed: onPressed,
          child: Text(buttonText),
        ),
      );

  }
}