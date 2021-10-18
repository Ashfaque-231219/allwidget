import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isspeaking = false;
  final TextEditingController _controller = new TextEditingController();
  final _flutterTts = new FlutterTts();
  void initialize() {
    _flutterTts.setStartHandler(() {
      isspeaking = false;
    });
    _flutterTts.setCompletionHandler(() {
      isspeaking = false;
    });
    _flutterTts.setErrorHandler((message) {
      isspeaking = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialize();
  }

  void speak() async {
    if (_controller.text.isNotEmpty) {
      await _flutterTts.speak(_controller.text);
    }
  }

  void stop() async {
    await _flutterTts.stop();
    setState(() {
      isspeaking = false;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Text to Speech",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Text to Speech in flutter"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient:
                LinearGradient(colors: [Colors.yellow, Colors.green])),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(17.0),
              child: Container(
                height: 40,
                width: double.infinity,
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                      hintText: "Write anything to listen",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  isspeaking ? stop() : speak();
                },
                child: Text(isspeaking ? "stop" : "speak")),
          ],
        ),
      ),
    );
  }
}
