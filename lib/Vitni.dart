import 'package:flutter/material.dart';


class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MaterialApp> {
  String selectedButton = '';
  List<bool> selectedOptions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button Grid'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              children: [
                CustomButton(
                  buttonText: 'Framendi',
                  onPressed: () {
                    setState(() {
                      selectedButton = 'Framendi';
                      selectedOptions = List<bool>.filled(3, false);
                    });
                    _showOptions(context);
                  },
                ),
                CustomButton(
                  buttonText: 'Bakendi',
                  onPressed: () {
                    setState(() {
                      selectedButton = 'Bakendi';
                      selectedOptions = List<bool>.filled(3, false);
                    });
                    _showOptions(context);
                  },
                ),
                CustomButton(
                  buttonText: 'Kassadeild',
                  onPressed: () {
                    setState(() {
                      selectedButton = 'Kassadeild';
                      selectedOptions = List<bool>.filled(3, false);
                    });
                    _showOptions(context);
                  },
                ),
                CustomButton(
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
      ),
    );
  }

  void _showOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Options for $selectedButton'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var i = 0; i < 3; i++)
                CheckboxListTile(
                  title: Text(buttonOptions[selectedButton]![i]),
                  value: selectedOptions[i],
                  onChanged: (value) {
                    setState(() {
                      selectedOptions[i] = value!;
                    });
                  },
                ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  final Map<String, List<String>> buttonOptions = {
    'Framendi': ['Arnar', 'Þröstur', 'Engilbert'],
    'Bakendi': ['Grímur', 'Marzúk', 'Fannar'],
    'Kassadeild': ['Tómas', 'Þór', 'Kormákur'],
    'Söludeild': ['Sara', 'Federica', 'Gunnar'],
  };
}

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  CustomButton({required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: SizedBox(
        width: 50, // Adjust the width as needed
        height: 50, // Adjust the height as needed
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(buttonText),
        ),
      ),
    );
  }
}