import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotAccessiblePage extends StatelessWidget {
  const NotAccessiblePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Not accessible page'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Text('Zamówienie nr 1'),
                ColoredBox(color: Colors.green,child: SizedBox(width: 20, height: 20,)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Text('Zamówienie nr 2'),
                ColoredBox(color: Colors.red, child: SizedBox(width: 20, height: 20,),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: const [
                Text('Newsletter'), StatefulSwitch(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: const [
                CustomCheckBox(),
                SizedBox(width: 8,),
                Text('Powiadomienia'),
              ],
            ),
          ),
          const Text('Lorem ipsum dolor sit amet', style: TextStyle(fontSize: 9),),
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Container(width: 100, height: 100, decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12),
              shape: BoxShape.rectangle,
            ),
              padding: const EdgeInsets.all(8),
              child: const Center(child: Text('consectetur adipiscing elit, sed do eiusmod tempor')),
            ),
          )
        ],
      ),
    );
  }
}

class StatefulSwitch extends StatefulWidget {
  const StatefulSwitch({super.key});

  @override
  State<StatefulWidget> createState() => SwitchState();
}

class SwitchState extends State<StatefulSwitch> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) => Switch(
    value: _isChecked,
    onChanged: (isChecked) => setState(() => _isChecked = isChecked),
  );
}

class CustomCheckBox extends StatefulWidget {

  const CustomCheckBox({super.key});

  @override
  CustomCheckBoxState createState() => CustomCheckBoxState();
}

class CustomCheckBoxState extends State<CustomCheckBox> {
  late bool _isCheck;

  @override
  void initState() {
    super.initState();
    _isCheck = true;
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: updateState,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: SvgPicture.asset(
          _isCheck ? 'assets/checked.svg' : 'assets/unchecked.svg',
          key: ValueKey(_isCheck),
        ),
      ),
    );

  void updateState() {
    setState(() => _isCheck = !_isCheck);
  }
}
