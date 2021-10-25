import 'package:flutter/material.dart';

class ModifiersWidget extends StatefulWidget {
  final String title;
  final List<String> radioList;

  const ModifiersWidget({Key key, this.title, this.radioList})
      : super(key: key);

  @override
  _ModifiersWidgetState createState() => _ModifiersWidgetState();
}

class _ModifiersWidgetState extends State<ModifiersWidget> {
  String _radioGroup;
  @override
  void initState() {
    setState(() {
      _radioGroup=widget.radioList.first;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
        createRadioListWidget()
     ,
    );
  }

  List<Widget> createRadioListWidget() {
    List<Widget> widgets = [];
    widget.radioList.forEach((element) {
      widgets.add(
        Row(
          children: [
          Text('$element'),
            Radio(
              value: element,
              groupValue: _radioGroup,
              onChanged: (String value) {
                setState(() {
                  _radioGroup = value;
                });
              },
            ),

          ],
        ),
      );
    });
    return widgets;
  }
}
