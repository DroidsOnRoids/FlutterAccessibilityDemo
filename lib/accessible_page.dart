import 'package:flutter/material.dart';

class AccessiblePage extends StatelessWidget {
  const AccessiblePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accessible Page'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MergeSemantics(
              child: Row(
                children: [
                  const Text('Zamówienie nr 1'),
                  Semantics(
                    label: 'Opłacone',
                    child: const Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MergeSemantics(
              child: Row(
                children: [
                  const Text('Zamówienie nr 2'),
                  Semantics(
                      tooltip: 'Nieopłacone',
                      child: const Icon(
                        Icons.close,
                        color: Colors.red,
                      ))
                ],
              ),
            ),
          ),
          const StatefulSwitchListTile(),
          const AccessibleCheckBox(),
          const Text(
            'Lorem ipsum dolor sit amet',
            style: TextStyle(fontSize: 11),
          ),
          Align(
            alignment: AlignmentDirectional.topStart,
            child: ConstrainedBox(
              constraints: const BoxConstraints.tightFor(width: 100),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                  shape: BoxShape.rectangle,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                      child:
                          Text('consectetur adipiscing elit, sed do eiusmod tempor')),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StatefulSwitchListTile extends StatefulWidget {
  const StatefulSwitchListTile({super.key});

  @override
  State<StatefulWidget> createState() => SwitchListTileState();
}

class SwitchListTileState extends State<StatefulSwitchListTile> {
  bool _isChecked = true;

  @override
  Widget build(BuildContext context) => SwitchListTile.adaptive(
        value: _isChecked,
        onChanged: (isChecked) => setState(() => _isChecked = isChecked),
        title: const Text('Newsletter'),
      );
}

class AccessibleCheckBox extends StatefulWidget {
  const AccessibleCheckBox({super.key});

  @override
  State<AccessibleCheckBox> createState() => _AccessibleCheckBoxState();
}

class _AccessibleCheckBoxState extends State<AccessibleCheckBox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) => ListTileTheme(
        horizontalTitleGap: 0,
        dense: true,
        child: Theme(
          data: ThemeData(
            checkboxTheme: CheckboxThemeData(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          child: CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            checkColor: const Color(0xff000000),
            activeColor: const Color(0xffFDE123),
            contentPadding: EdgeInsets.zero,
            value: _isChecked,
            onChanged: (bool? newValue) =>
                setState(() => _isChecked = newValue ?? false),
            title: const Text('Powiadomienia'),
          ),
        ),
      );
}
