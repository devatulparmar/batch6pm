import 'package:batch6pm/march12/test.dart';
import 'package:batch6pm/video_play/video_player_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const VideoPlayerScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool isObscureText = true;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Email'),
                      SizedBox(height: 50),
                      Text('Password'),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Column(
                      children: [
                        TextField(
                          controller: _controller,
                          onChanged: (value) {
                            setState(() {
                              debugPrint(value);
                            });
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 2),
                            ),
                            suffixIcon: Icon(Icons.search),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: _passController,
                          obscureText: isObscureText,
                          obscuringCharacter: '*',
                          onChanged: (value) {
                            setState(() {
                              debugPrint(value);
                            });
                          },
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 20),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isObscureText = !isObscureText;
                                });
                              },
                              icon: isObscureText
                                  ? const Icon(
                                      Icons.remove_red_eye,
                                      color: Colors.grey,
                                    )
                                  : const Icon(
                                      Icons.remove_red_eye,
                                      color: Colors.blue,
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Text(
              _controller.text,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
