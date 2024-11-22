import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import 'my_text.dart';

class SpeechToTextPage extends StatefulWidget {
  @override
  _SpeechToTextPage createState() => _SpeechToTextPage();
}

class _SpeechToTextPage extends State<SpeechToTextPage> {
  final TextEditingController _textController = TextEditingController();

  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = "";

  void listenForPermissions() async {
    final status = await Permission.microphone.status;
    if (status == PermissionStatus.denied) {
      return requestForPermission();
    } else if (status == PermissionStatus.granted) {
    } else if (status == PermissionStatus.limited) {
    } else if (status == PermissionStatus.permanentlyDenied) {
    } else if (status == PermissionStatus.restricted) {}
  }

  Future<void> requestForPermission() async {
    await Permission.microphone.request();
  }

  @override
  void initState() {
    super.initState();
    listenForPermissions();
    if (!_speechEnabled) {
      _initSpeech();
    }
  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
  }

  void _startListening() async {
    await _speechToText.listen(
      onResult: _onSpeechResult,
      listenFor: const Duration(seconds: 30),
      localeId: "en_En",
      cancelOnError: false,
      partialResults: false,
      listenMode: ListenMode.confirmation,
    );
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = "$_lastWords${result.recognizedWords} ";
      _textController.text = _lastWords;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(
              color: Color(0xff686D76).withOpacity(.15),
              width: 1,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (_speechToText.isNotListening)
                MyText(
                  text: "Speak Here",
                  weight: FontWeight.w600,
                  textScale: 5.sp,
                ),
              SizedBox(height: context.height * .5.sp),
              GestureDetector(
                onTap: () {
                  setState(() {});
                  if (_speechToText.isListening) {
                    _stopListening();
                    _textController.text = _lastWords;
                  } else {
                    _startListening();
                  }
                },
                child: _speechToText.isListening
                    ? AvatarGlow(
                        glowRadiusFactor: 0.5,
                        glowColor: Color(0xffFF3939),
                        duration: Duration(milliseconds: 2000),
                        repeat: true,
                        child: Container(
                          padding: EdgeInsets.all(18.sp),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xffFF3939),
                                Color(0xffBB171E),
                              ],
                            ),
                          ),
                          child: SvgPicture.asset(
                            "assets/svgs/mic.svg",
                            height: context.height * .75.sp,
                          ),
                        ),
                      )
                    : Container(
                        padding: EdgeInsets.all(18.sp),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xffFF3939),
                              Color(0xffBB171E),
                            ],
                          ),
                        ),
                        child: SvgPicture.asset(
                          "assets/svgs/mic.svg",
                          height: context.height * .75.sp,
                        ),
                      ),
              ),
              SizedBox(height: context.height * .6.sp),
            ],
          ),
        ),
        MyText(
          text: "Recorded Text",
          textScale: 5.75.sp,
          weight: FontWeight.w600,
          family: "Poppin",
        ).paddingSymmetric(vertical: 12.sp),
        TextFormField(
          maxLines: 6,
          controller: _textController,
          decoration: InputDecoration(
            hintText: "Speak Something.....",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.sp),
              borderSide: BorderSide(
                color: Color(0xff686D76).withOpacity(.15),
                width: .7,
              ),
            ),
          ),
        ),
      ],
    );
  }
}