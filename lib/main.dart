// // // // import 'package:flutter/material.dart';
// // // // import 'package:alan_voice/alan_voice.dart';
// // // //
// // // // void main() => runApp(MyApp());
// // // //
// // // // class MyApp extends StatelessWidget {
// // // //   // This widget is the root of your application.
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return MaterialApp(
// // // //       title: 'Alan Basic Example',
// // // //       theme: ThemeData(
// // // //         // This is the theme of your application.
// // // //         //
// // // //         // Try running your application with "flutter run". You'll see the
// // // //         // application has a blue toolbar. Then, without quitting the app, try
// // // //         // changing the primarySwatch below to Colors.green and then invoke
// // // //         // "hot reload" (press "r" in the console where you ran "flutter run",
// // // //         // or simply save your changes to "hot reload" in a Flutter IDE).
// // // //         // Notice that the counter didn't reset back to zero; the application
// // // //         // is not restarted.
// // // //         primarySwatch: Colors.blue,
// // // //       ),
// // // //       home: MyHomePage(title: 'Flutter Alan Basic Example'),
// // // //     );
// // // //   }
// // // // }
// // // //
// // // // class MyHomePage extends StatefulWidget {
// // // //   MyHomePage({Key? key, required this.title}) : super(key: key);
// // // //
// // // //   // This widget is the home page of your application. It is stateful, meaning
// // // //   // that it has a State object (defined below) that contains fields that affect
// // // //   // how it looks.
// // // //
// // // //   // This class is the configuration for the state. It holds the values (in this
// // // //   // case the title) provided by the parent (in this case the App widget) and
// // // //   // used by the build method of the State. Fields in a Widget subclass are
// // // //   // always marked "final".
// // // //
// // // //   final String title;
// // // //
// // // //   @override
// // // //   _MyHomePageState createState() => _MyHomePageState();
// // // // }
// // // //
// // // // class _MyHomePageState extends State<MyHomePage> {
// // // //
// // // //   _MyHomePageState() {
// // // //     _initAlanButton();
// // // //   }
// // // //
// // // //   void _initAlanButton() {
// // // //     AlanVoice.addButton(
// // // //         "314203787ccd9370974f1bf6b6929c1b2e956eca572e1d8b807a3e2338fdd0dc/prod"
// // // //     );
// // // //
// // // //     AlanVoice.onCommand.add((command) {
// // // //       debugPrint("got new command ${command.toString()}");
// // // //       var commandName = command.data["command"] ?? "";
// // // //       if (commandName == "showAlert") {
// // // //         /// handle command "showAlert"
// // // //       }
// // // //     });
// // // //
// // // //     AlanVoice.onEvent.add((event) {
// // // //       debugPrint("got new event ${event.data.toString()}");
// // // //     });
// // // //
// // // //     AlanVoice.onButtonState.add((state) {
// // // //       debugPrint("got new button state ${state.name}");
// // // //     });
// // // //   }
// // // //
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     // This method is rerun every time setState is called, for instance as done
// // // //     // by the _incrementCounter method above.
// // // //     //
// // // //     // The Flutter framework has been optimized to make rerunning build methods
// // // //     // fast, so that you can just rebuild anything that needs updating rather
// // // //     // than having to individually change instances of widgets.
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         // Here we take the value from the MyHomePage object that was created by
// // // //         // the App.build method, and use it to set our appbar title.
// // // //         title: Text(widget.title),
// // // //       ),
// // // //       body: Center(
// // // //         // Center is a layout widget. It takes a single child and positions it
// // // //         // in the middle of the parent.
// // // //         child: Column(
// // // //           // Column is also a layout widget. It takes a list of children and
// // // //           // arranges them vertically. By default, it sizes itself to fit its
// // // //           // children horizontally, and tries to be as tall as its parent.
// // // //           //
// // // //           // Invoke "debug painting" (press "p" in the console, choose the
// // // //           // "Toggle Debug Paint" action from the Flutter Inspector in Android
// // // //           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
// // // //           // to see the wireframe for each widget.
// // // //           //
// // // //           // Column has various properties to control how it sizes itself and
// // // //           // how it positions its children. Here we use mainAxisAlignment to
// // // //           // center the children vertically; the main axis here is the vertical
// // // //           // axis because Columns are vertical (the cross axis would be
// // // //           // horizontal).
// // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // //           children: <Widget>[
// // // //             Text(
// // // //               'Hello, Alan',
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// import 'dart:async';
// import 'dart:io' show Platform;
// import 'package:flutter/foundation.dart' show kIsWeb;
//
// import 'package:flutter/material.dart';
// import 'package:flutter_tts/flutter_tts.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// enum TtsState { playing, stopped, paused, continued }
//
// class _MyAppState extends State<MyApp> {
//   late FlutterTts flutterTts;
//   String? language;
//   String? engine;
//   double volume = 0.5;
//   double pitch = 1.0;
//   double rate = 0.5;
//   bool isCurrentLanguageInstalled = false;
//
//   String? _newVoiceText;
//   int? _inputLength;
//
//   TtsState ttsState = TtsState.stopped;
//
//   get isPlaying => ttsState == TtsState.playing;
//   get isStopped => ttsState == TtsState.stopped;
//   get isPaused => ttsState == TtsState.paused;
//   get isContinued => ttsState == TtsState.continued;
//
//   bool get isIOS => !kIsWeb && Platform.isIOS;
//   bool get isAndroid => !kIsWeb && Platform.isAndroid;
//   bool get isWindows => !kIsWeb && Platform.isWindows;
//   bool get isWeb => kIsWeb;
//
//   @override
//   initState() {
//     super.initState();
//     initTts();
//   }
//
//   initTts() {
//     flutterTts = FlutterTts();
//
//     _setAwaitOptions();
//
//     if (isAndroid) {
//       _getDefaultEngine();
//       _getDefaultVoice();
//     }
//
//     flutterTts.setStartHandler(() {
//       setState(() {
//         print("Playing");
//         ttsState = TtsState.playing;
//       });
//     });
//
//     if (isAndroid) {
//       flutterTts.setInitHandler(() {
//         setState(() {
//           print("TTS Initialized");
//         });
//       });
//     }
//
//     flutterTts.setCompletionHandler(() {
//       setState(() {
//         print("Complete");
//         ttsState = TtsState.stopped;
//       });
//     });
//
//     flutterTts.setCancelHandler(() {
//       setState(() {
//         print("Cancel");
//         ttsState = TtsState.stopped;
//       });
//     });
//
//     flutterTts.setPauseHandler(() {
//       setState(() {
//         print("Paused");
//         ttsState = TtsState.paused;
//       });
//     });
//
//     flutterTts.setContinueHandler(() {
//       setState(() {
//         print("Continued");
//         ttsState = TtsState.continued;
//       });
//     });
//
//     flutterTts.setErrorHandler((msg) {
//       setState(() {
//         print("error: $msg");
//         ttsState = TtsState.stopped;
//       });
//     });
//   }
//
//   Future<dynamic> _getLanguages() async => await flutterTts.getLanguages;
//
//   Future<dynamic> _getEngines() async => await flutterTts.getEngines;
//
//   Future _getDefaultEngine() async {
//     var engine = await flutterTts.getDefaultEngine;
//     if (engine != null) {
//       print(engine);
//     }
//   }
//
//   Future _getDefaultVoice() async {
//     var voice = await flutterTts.getDefaultVoice;
//     if (voice != null) {
//       print(voice);
//     }
//   }
//
//   Future _speak() async {
//     await flutterTts.setVolume(volume);
//     await flutterTts.setSpeechRate(rate);
//     await flutterTts.setPitch(pitch);
//
//     if (_newVoiceText != null) {
//       if (_newVoiceText!.isNotEmpty) {
//         await flutterTts.speak(_newVoiceText!);
//       }
//     }
//   }
//
//   Future _setAwaitOptions() async {
//     await flutterTts.awaitSpeakCompletion(true);
//   }
//
//   Future _stop() async {
//     var result = await flutterTts.stop();
//     if (result == 1) setState(() => ttsState = TtsState.stopped);
//   }
//
//   Future _pause() async {
//     var result = await flutterTts.pause();
//     if (result == 1) setState(() => ttsState = TtsState.paused);
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     flutterTts.stop();
//   }
//
//   List<DropdownMenuItem<String>> getEnginesDropDownMenuItems(dynamic engines) {
//     var items = <DropdownMenuItem<String>>[];
//     for (dynamic type in engines) {
//       items.add(DropdownMenuItem(
//           value: type as String?, child: Text(type as String)));
//     }
//     return items;
//   }
//
//   void changedEnginesDropDownItem(String? selectedEngine) async {
//     await flutterTts.setEngine(selectedEngine!);
//     language = null;
//     setState(() {
//       engine = selectedEngine;
//     });
//   }
//
//   List<DropdownMenuItem<String>> getLanguageDropDownMenuItems(
//       dynamic languages) {
//     var items = <DropdownMenuItem<String>>[];
//     for (dynamic type in languages) {
//       items.add(DropdownMenuItem(
//           value: type as String?, child: Text(type as String)));
//     }
//     return items;
//   }
//
//   void changedLanguageDropDownItem(String? selectedType) {
//     setState(() {
//       language = selectedType;
//       flutterTts.setLanguage(language!);
//       if (isAndroid) {
//         flutterTts
//             .isLanguageInstalled(language!)
//             .then((value) => isCurrentLanguageInstalled = (value as bool));
//       }
//     });
//   }
//
//   void _onChange(String text) {
//     setState(() {
//       _newVoiceText = text;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Flutter TTS'),
//         ),
//         body: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Column(
//             children: [
//               _inputSection(),
//               _btnSection(),
//               // _engineSection(),
//               // _futureBuilder(),
//               // _buildSliders(),
//               // if (isAndroid) _getMaxSpeechInputLengthSection(),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _engineSection() {
//     if (isAndroid) {
//       return FutureBuilder<dynamic>(
//           future: _getEngines(),
//           builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//             if (snapshot.hasData) {
//               return _enginesDropDownSection(snapshot.data);
//             } else if (snapshot.hasError) {
//               return Text('Error loading engines...');
//             } else
//               return Text('Loading engines...');
//           });
//     } else
//       return Container(width: 0, height: 0);
//   }
//
//   Widget _futureBuilder() => FutureBuilder<dynamic>(
//       future: _getLanguages(),
//       builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//         if (snapshot.hasData) {
//           return _languageDropDownSection(snapshot.data);
//         } else if (snapshot.hasError) {
//           return Text('Error loading languages...');
//         } else
//           return Text('Loading Languages...');
//       });
//
//   Widget _inputSection() => Container(
//       alignment: Alignment.topCenter,
//       padding: EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
//       child: TextField(
//         maxLines: 11,
//         minLines: 6,
//         onChanged: (String value) {
//           _onChange(value);
//         },
//       ));
//
//   Widget _btnSection() {
//     return Container(
//       padding: EdgeInsets.only(top: 50.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           _buildButtonColumn(Colors.green, Colors.greenAccent, Icons.play_arrow,
//               'PLAY', _speak),
//           _buildButtonColumn(
//               Colors.red, Colors.redAccent, Icons.stop, 'STOP', _stop),
//           _buildButtonColumn(
//               Colors.blue, Colors.blueAccent, Icons.pause, 'PAUSE', _pause),
//         ],
//       ),
//     );
//   }
//
//   Widget _enginesDropDownSection(dynamic engines) => Container(
//     padding: EdgeInsets.only(top: 50.0),
//     child: DropdownButton(
//       value: engine,
//       items: getEnginesDropDownMenuItems(engines),
//       onChanged: changedEnginesDropDownItem,
//     ),
//   );
//
//   Widget _languageDropDownSection(dynamic languages) => Container(
//       padding: EdgeInsets.only(top: 10.0),
//       child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//         DropdownButton(
//           value: language,
//           items: getLanguageDropDownMenuItems(languages),
//           onChanged: changedLanguageDropDownItem,
//         ),
//         Visibility(
//           visible: isAndroid,
//           child: Text("Is installed: $isCurrentLanguageInstalled"),
//         ),
//       ]));
//
//   Column _buildButtonColumn(Color color, Color splashColor, IconData icon,
//       String label, Function func) {
//     return Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           IconButton(
//               icon: Icon(icon),
//               color: color,
//               splashColor: splashColor,
//               onPressed: () => func()),
//           Container(
//               margin: const EdgeInsets.only(top: 8.0),
//               child: Text(label,
//                   style: TextStyle(
//                       fontSize: 12.0,
//                       fontWeight: FontWeight.w400,
//                       color: color)))
//         ]);
//   }
//
//   Widget _getMaxSpeechInputLengthSection() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         ElevatedButton(
//           child: Text('Get max speech input length'),
//           onPressed: () async {
//             _inputLength = await flutterTts.getMaxSpeechInputLength;
//             setState(() {});
//           },
//         ),
//         Text("$_inputLength characters"),
//       ],
//     );
//   }
//
//   Widget _buildSliders() {
//     return Column(
//       children: [_volume(), _pitch(), _rate()],
//     );
//   }
//
//   Widget _volume() {
//     return Slider(
//         value: volume,
//         onChanged: (newVolume) {
//           setState(() => volume = newVolume);
//         },
//         min: 0.0,
//         max: 1.0,
//         divisions: 10,
//         label: "Volume: $volume");
//   }
//
//   Widget _pitch() {
//     return Slider(
//       value: pitch,
//       onChanged: (newPitch) {
//         setState(() => pitch = newPitch);
//       },
//       min: 0.5,
//       max: 2.0,
//       divisions: 15,
//       label: "Pitch: $pitch",
//       activeColor: Colors.red,
//     );
//   }
//
//   Widget _rate() {
//     return Slider(
//       value: rate,
//       onChanged: (newRate) {
//         setState(() => rate = newRate);
//       },
//       min: 0.0,
//       max: 1.0,
//       divisions: 10,
//       label: "Rate: $rate",
//       activeColor: Colors.green,
//     );
//   }
// }
// // import 'package:flutter/material.dart';
// // import 'package:talkjs_flutter/talkjs_flutter.dart';
// //
// // void main() {
// //   runApp(const MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   const MyApp({Key? key}) : super(key: key);
// //
// //   // This widget is the root of your application.
// //   @override
// //   Widget build(BuildContext context) {
// //     final session = Session(appId: 'YOUR_APP_ID');
// //
// //     final me = session.getUser(
// //       id: '123456',
// //       name: 'Alice',
// //       email: ['alice@example.com'],
// //       photoUrl: 'https://talkjs.com/images/avatar-1.jpg',
// //       welcomeMessage: 'Hey there! How are you? :-)',
// //       role: 'default',
// //     );
// //
// //     session.me = me;
// //
// //     final other = session.getUser(
// //       id: '654321',
// //       name: 'Sebastian',
// //       email: ['Sebastian@example.com'],
// //       photoUrl: 'https://talkjs.com/images/avatar-5.jpg',
// //       welcomeMessage: 'Hey, how can I help?',
// //       role: 'default',
// //     );
// //
// //     final conversation = session.getConversation(
// //       id: Talk.oneOnOneId(me.id, other.id),
// //       participants: {Participant(me), Participant(other)},
// //     );
// //
// //     return MaterialApp(
// //       title: 'TalkJS Demo',
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: const Text('TalkJS Demo'),
// //         ),
// //         body: ChatBox(
// //           session: session,
// //           conversation: conversation,
// //         ),
// //       ),
// //     );
// //   }
// // }

import 'dart:async';
import 'dart:convert';

import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';
void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textEdit = TextEditingController();

  XFile? file;
  String? url;
  Color backgroundColor =Colors.white;
VideoPlayerController? videoPlayerController;
ChewieController? chewieController;
List  listAvatar =[];
List  colorList =[
  {
    "name":Colors.redAccent,
    "value":"#FF0000",
  },

  {
    "name":Colors.blueAccent,
    "value": "#ADD8E6",
  },

  {
    "name":Colors.yellowAccent,
    "value":"#FFFF00",
  },

  {
    "name":Colors.purpleAccent,
    "value": "#800080",
  },

  {
    "name":Colors.tealAccent,
    "value":  "#008080",
  },

  {
    "name":Colors.indigoAccent,
    "value": "#4B0082",
  },

  {
    "name":Colors.lightGreenAccent,
    "value": "#90EE90",
  },

];
String avtarId ='';
String voiceId ='';
String? value;
String? color;
bool isAvatars = false;
bool isBackground = false;
bool loader = false;
  @override
  void initState() {
init();
    super.initState();
  }


  init()async{
   listAvatar = await avtarList();
   setState(() {

   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    const SizedBox(
                    height: 50,
                  ),

                  InkWell(
                    onTap: (){
                      isAvatars = true;
                      setState(() {

                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child:  Text(value ?? "Please Select Avatar"),
                    ),
                  ),
                  isAvatars ?SizedBox(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        itemCount: listAvatar.length,
                        itemBuilder: (context,i){
                          return InkWell(
                            onTap: (){
                              value = listAvatar[i]['avatar_name'];
                              avtarId = listAvatar[i]['id'];
                              voiceId = listAvatar[i]["default_voice"]["free"]['voice_id'];
                              isAvatars = false;
                              setState(() {

                              });
                            },
                            child: Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        height:40,
                                        width: 40,
                                        decoration:BoxDecoration(
                                      shape:BoxShape.circle,
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                listAvatar[i]['normal_thumbnail_medium'],
                                            ),
                                            fit: BoxFit.cover
                                          )
                                  ),
                                      ),
                                      const SizedBox(width: 30,),
                                      Text(listAvatar[i]['avatar_name']),
                                    ],
                                  ),
                                )),
                          );
                        }),
                  ):const SizedBox(),
                   SizedBox(
                    height:  isAvatars ?20:0,
                  ),



                  InkWell(
                    onTap: (){
                      isBackground = true;
                      setState(() {

                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      color: (color != null)?backgroundColor:Colors.transparent,
                      child:  (color == null)?Text(value ?? "Please Select background color"):const SizedBox(),
                    ),
                  ),
                  isBackground ?SizedBox(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        itemCount: colorList.length,
                        itemBuilder: (context,i){
                          return InkWell(
                            onTap: (){
backgroundColor = colorList[i]['name'];
color = colorList[i]['value'];
isBackground = false;
setState(() {
  
});
                            },
                            child: Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width,
                            color: colorList[i]['name'],
                            ),
                          );
                        }),
                  ):const SizedBox(),
                  SizedBox(
                    height:  20,
                  ),


                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: "Enter text here", border: OutlineInputBorder()),
                    controller: textEdit,
                  ),
                  const SizedBox(
                    height: 50,),
                  // ElevatedButton(
                  //     onPressed: () async {
                  //       file =
                  //           await ImagePicker().pickImage(source: ImageSource.gallery);
                  //     },
                  //     child: const Text("Upload your avtar")),


                  ElevatedButton(
                      onPressed: () async {
                       await apiCalling(text: textEdit.text,image: '');
                      },
                      child: const Text("Upload")),

                  url != null?
    Chewie(
    controller: chewieController!,
    )
                      :const SizedBox()
                ],
              ),
            ),
            (loader == true)?const CircularProgressIndicator():const SizedBox()
          ],
        ),
      ),
    );
  }

  apiCalling({
    required String text,
    required String image,
})async{
    var headers = {
      'X-Api-Key': 'ODUxMDk3OTliYzk3NDZiMDg4MzE1NTRkMWQ0Y2UxYjItMTcwMDgxOTY4OA==',
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('https://api.heygen.com/v1/video.generate'));
    request.body = json.encode({
      "background": "$color",
      "clips": [
        {
          "avatar_id": (avtarId =="")?"Daisy-inskirt-20220818":avtarId,
          "avatar_style": "normal",
          "input_text": "$text",
          "offset": {
            "x": 0,
            "y": 0
          },
          "scale": 1,
          "voice_id": //"bc22af81440d4212acf315103d7faf82"
          (voiceId =="")?"009f4cb8d98a4febb45f8c82a5399b15":voiceId
        }
      ],
      "ratio": "16:9",
      "test": true,
      "version": "v1alpha"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

      var data = await response.stream.bytesToString();
      loader= true;
      setState(() {
print(data);
      });
      Timer.periodic(const Duration(minutes: 1), (timer) async {

    var i = await getVideo(jsonDecode(data)['data']['video_id']);
    if(i != null)
      {
        print("=====================");
        timer.cancel();
        loader= false;
        setState(() {

        });
        url = i;
        videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(i));
        chewieController = ChewieController(
          videoPlayerController: videoPlayerController!,
          autoPlay: true,
          looping: false,
        );

        setState(() {

        });
      }
      });
    }
    else {
      print(response.reasonPhrase);
    }

  }

  getVideo(String videoId)async{
    var headers = {
      'X-Api-Key': 'ODUxMDk3OTliYzk3NDZiMDg4MzE1NTRkMWQ0Y2UxYjItMTcwMDgxOTY4OA=='
    };
    var request = http.Request('GET', Uri.parse('https://api.heygen.com/v1/video_status.get?video_id=$videoId'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var d = await response.stream.bytesToString();
     return jsonDecode(d)['data']['video_url'];

    }
    else {
    print(response.reasonPhrase);
    return "";
    }

  }

  avtarList()async{

    var headers = {
      'accept': 'application/json',
      'x-api-key': 'ODUxMDk3OTliYzk3NDZiMDg4MzE1NTRkMWQ0Y2UxYjItMTcwMDgxOTY4OA=='
    };
    var request = http.Request('GET', Uri.parse('https://api.movio.la/v1/avatar.list'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
     var data  = await response.stream.bytesToString();
List avatarData =[];
     jsonDecode(data)['data']['avatars'].forEach((e){

         avatarData.add(e['avatar_states'][0]);

     });
     return avatarData;
    }
    else {
    print(response.reasonPhrase);
    return [];
    }

  }
}
