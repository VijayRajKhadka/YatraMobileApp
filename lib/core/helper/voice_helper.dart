import 'package:flutter_tts/flutter_tts.dart';

class VoiceHelper{
  final FlutterTts flutterTts = FlutterTts();

  speak(String data)async{
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(data);
  }

  pause()async{
    await flutterTts.pause();
  }

  stop()async{
    await flutterTts.stop();
  }

}