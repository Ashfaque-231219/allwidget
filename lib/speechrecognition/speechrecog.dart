import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:speech_to_text/speech_to_text.dart'as stt;
class SpeechScreenState extends StatefulWidget {
  const SpeechScreenState({Key? key}) : super(key: key);

  @override
  _SpeechScreenStateState createState() => _SpeechScreenStateState();
}

class _SpeechScreenStateState extends State<SpeechScreenState> {
  late stt.SpeechToText _speech;
  bool isListening = false;
  String _textspeech = "Press the Button to Start Speaking";
  void onListing() async {
    if(! isListening){
      bool available = await _speech.initialize(
          onStatus: (val) => print('On Status: $val'),
          onError: (val) => print('on Error : $val')
      );
      if(available){
        setState(() {
          isListening = true;
        });
        _speech.listen(
            onResult: (val) => setState((){
              _textspeech = val.recognizedWords;
            })
        );

      }


    }
    else{
      setState(() {
        isListening = false;
        _speech.stop();
      });
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _speech = stt.SpeechToText();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Speech to Text"),
      ),
      floatingActionButton: AvatarGlow(
        animate: isListening,
        glowColor: Theme.of(context).primaryColor,
        endRadius: 80,
        duration: Duration(milliseconds: 20000),
        repeatPauseDuration: Duration(milliseconds: 100),
        repeat: true,
        child: FloatingActionButton(
          onPressed: () => onListing(),
          child: Icon(isListening ? Icons.mic: Icons.mic_none),
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
          child: Text(_textspeech,style: TextStyle(
              fontSize: 32,
              color: Colors.black,
              fontWeight: FontWeight.bold
          ),),
        ),
      ),



    );
  }
}
