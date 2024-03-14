import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
 final String name,
      password,
      gender,
      checkboxValue1,
      checkboxValue2,
      checkboxValue3,
      dropDownValue;

  const Screen2({
    super.key,
    required this.name,
    required this.password,
    required this.gender,
    required this.checkboxValue1,
    required this.checkboxValue2,
    required this.checkboxValue3,
    required this.dropDownValue,
  });

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: Column(
        children: [
          Text(widget.name),
          Text(widget.password),
          Text(widget.gender),
          Text(widget.checkboxValue1),
          Text(widget.checkboxValue2),
          Text(widget.checkboxValue3),
          Text(widget.dropDownValue),
        ],
      ),
    );
  }
}
