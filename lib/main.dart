import 'package:allwidget/Registrationform/RegistraionPage.dart';
import 'package:allwidget/speechrecognition/speechrecog.dart';
import 'package:allwidget/texttospeechrecognition/texttospeechrecognition.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyForm());
}

class MyForm extends StatelessWidget {
  final navigatorkey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Registration Form",
      navigatorKey: navigatorkey,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.topLeft,
                    colors: [Colors.white, Colors.blue])),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 30,left: 30),
              child: PopupMenuButton(
                child: Icon(
                  Icons.more_vert,
                  size: 28,
                ),
                itemBuilder: (context) => [
                  PopupMenuItem(
                      value: 1,
                      child: Row(
                        children: [
                          Icon(Icons.offline_bolt, color: Colors.black),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text("Registration Form"),
                          ),
                        ],
                      )),
                  PopupMenuItem(
                      value: 2,
                      child: Row(
                        children: [
                          Icon(Icons.offline_bolt, color: Colors.black),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text("Speech Recognition"),
                          ),
                        ],
                      )),
                  PopupMenuItem(
                      value: 3,
                      child: Row(
                        children: [
                          Icon(Icons.offline_bolt, color: Colors.black),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text("Text to Speech Recognition"),
                          ),
                        ],
                      )),
                ],
                onSelected: (int menu) {
                  if (menu == 1) {
                    navigatorkey.currentState!.push(MaterialPageRoute(
                        builder: (context) => RegistraionPage()));
                  } else if (menu == 2) {
                    navigatorkey.currentState!.push(MaterialPageRoute(
                        builder: (context) => SpeechScreenState()));
                  }
                  else if(menu == 3){
                    navigatorkey.currentState!.push(MaterialPageRoute(
                        builder: (context) => MyApp()));

                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30,right: 30),
              child: Icon(
                Icons.home,
                size: 28,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30,right: 30),
              child: Icon(
                Icons.person,
                size: 28,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30,right: 30),
              child: Icon(
                Icons.search,
                size: 28,
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 10,right: 10),
              child: Icon(
                Icons.notifications_none,
                size: 28,
              ),
            ),


          ],
        ),
      ),
    );
  }
}
