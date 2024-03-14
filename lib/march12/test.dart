import 'package:batch6pm/march12/screen2.dart';
import 'package:flutter/material.dart';

class March12Test extends StatefulWidget {
  const March12Test({super.key});

  @override
  State<March12Test> createState() => _March12TestState();
}

class _March12TestState extends State<March12Test> {
  int selectedOption = 0;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  List<String> list = <String>['One', 'Two', 'Three', 'Four'];

  bool checkboxValue1 = true;
  bool checkboxValue2 = true;
  bool checkboxValue3 = true;
  String dropdownValue = '';

  bool validate(context) {
    if (nameController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please enter text fields value')));
      return false;
    } else {
      return true;
    }
  }

  void clearData(){
    setState(() {
      nameController.clear();
      passwordController.clear();
      checkboxValue1 = false;
      checkboxValue2 = false;
      checkboxValue3 = false;
      selectedOption = 0;
      dropdownValue = list.first;
    });
  }

  @override
  void initState() {
    super.initState();
    dropdownValue = list.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Name'),
                    SizedBox(
                      height: 50,
                    ),
                    Text('Password'),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Column(
                    children: [
                      TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2))),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: passwordController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2))),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ListTile(
                    title: const Text('Male'),
                    leading: Radio<int>(
                      value: 0,
                      groupValue: selectedOption,
                      onChanged: (int? value) {
                        setState(() {
                          selectedOption = value!;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ListTile(
                    title: const Text('Female'),
                    leading: Radio<int>(
                      value: 1,
                      groupValue: selectedOption,
                      onChanged: (int? value) {
                        setState(() {
                          selectedOption = value!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: checkboxValue1,
                  onChanged: (bool? value) {
                    setState(() {
                      checkboxValue1 = value!;
                    });
                  },
                ),
                const Text('Checkbox 1'),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: checkboxValue2,
                  onChanged: (bool? value) {
                    setState(() {
                      checkboxValue2 = value!;
                    });
                  },
                ),
                const Text('Checkbox 2'),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: checkboxValue3,
                  onChanged: (bool? value) {
                    setState(() {
                      checkboxValue3 = value!;
                    });
                  },
                ),
                const Text('Checkbox 3'),
              ],
            ),
            Row(
              children: [
                DropdownMenu<String>(
                  initialSelection: list.first,
                  onSelected: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue = value!;
                    });
                  },

                  dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry<String>(
                        value: value, label: value);
                  }).toList(),
                )
              ],
            ),
            ElevatedButton(
              onPressed: () {
                if (validate(context)) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Screen2(
                          name: nameController.text,
                          password: passwordController.text,
                          gender: selectedOption == 0 ? 'Male' : 'Female',
                          checkboxValue1: checkboxValue1.toString(),
                          checkboxValue2: checkboxValue2.toString(),
                          checkboxValue3: checkboxValue3.toString(),
                          dropDownValue: dropdownValue,
                        ),
                      ),
                  );
                }
              },
              child: const Text('Go to Next Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                clearData();
              },
              child: const Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}
