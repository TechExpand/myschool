import 'package:flutter/material.dart';
import 'package:myschool/Screens/MessageComments.dart';
import 'package:myschool/Services/Network.dart';
import 'package:myschool/Utils/enum.dart';
import 'package:myschool/Utils/utils.dart';
import 'dart:ui' as ui;

import 'package:provider/provider.dart';

class GroupsMessage extends StatefulWidget {
  int id;
  String group_name;

  GroupsMessage(this.id, this.group_name);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GroupsMessageState();
  }
}

class GroupsMessageState extends State<GroupsMessage> {
  final formkey = GlobalKey<FormState>();
  var name;
  var content;
  var pro_pic;
  var admin;

  @override
  Widget build(BuildContext context) {
    var utils = Provider.of<Utils>(context, listen: false);
    var webservices = Provider.of<WebServices>(context, listen: false);
    return Scaffold(
      bottomNavigationBar: Container(
        child: Column(
          children: <Widget>[
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: PopupMenuButton<File_Message>(
                    icon: Icon(Icons.attach_file),
                    onSelected: (File_Message result) {
//                      setState(() {
//                        _selection = result;
//                      });
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<File_Message>>[
                      PopupMenuItem<File_Message>(
                        value: File_Message.video,
                        child: Container(
                          height: 70,
                          child: Column(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.deepPurple,
                                child: Icon(Icons.video_library),
                              ),
                              Text('Video')
                            ],
                          ),
                        ),
                      ),
                      PopupMenuItem<File_Message>(
                        value: File_Message.doc,
                        child: Container(
                          height: 70,
                          child: Column(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.orange,
                                child: Icon(Icons.headset),
                              ),
                              Text('Audio')
                            ],
                          ),
                        ),
                      ),
                      PopupMenuItem<File_Message>(
                        value: File_Message.audio,
                        child: Container(
                          height: 70,
                          child: Column(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.blue,
                                child: Icon(Icons.insert_drive_file),
                              ),
                              Text('Doc')
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(1),
                  child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Form(
                      key: formkey,
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'message is Required';
                          } else {
                            content = value;
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            labelText: 'Send Message',
                            labelStyle: TextStyle(
                              color: Colors.black87,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: webservices.login_state == false
                      ? Container(
                          child: IconButton(
                              icon: Icon(
                                Icons.send,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                if (formkey.currentState.validate()) {
                                  webservices.Create_Messege(
                                    context: context,
                                    content: content,
                                    group: widget.id,
                                  ).then((value) {
                                    setState(() {
                                      GroupsMessageState();
                                    });
                                  });
                                  webservices.Login_SetState();
                                }
                              }),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                        )
                      : CircularProgressIndicator(),
                )
              ],
            )
          ],
        ),
        height: 70,
      ),
      backgroundColor: const Color(0xffffffff),
      body: MessageBody(context),
    );
  }

  Widget MessageBody(context) {
    var webservices = Provider.of<WebServices>(context, listen: false);
    return FutureBuilder(
        future: Future.wait(
            [webservices.GetGroupMessage(widget.id), webservices.GetProfile()]),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Stack(
//                  alignment: Alignment.center,
                        children: <Widget>[
                          // Adobe XD layer: 'background' (shape)
                          Container(
                            height: 191.0,
                            decoration: BoxDecoration(
                              color: Colors.lightBlueAccent,
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      top:
                                          MediaQuery.of(context).size.width / 8,
                                      left: MediaQuery.of(context).size.width /
                                          20),
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ))),
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                                child: Padding(
                              padding:
                                  EdgeInsets.only(top: 90.0, left: 8, right: 8),
                              child: Text(
                                '${widget.group_name.toString()}',
                                style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 14,
                                  color: const Color(0xffffffff),
                                  height: 1.7142857142857142,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 60.0),
                              child: SizedBox(
                                height: 45.0,
                                child: Text(
                                  'MYCLAS',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Arial',
                                    fontSize: 20,
                                    color: const Color(0xffffffff),
                                    height: 1,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SafeArea(
                        child: Container(
                          child: ListView.builder(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data[0]==null?0:snapshot.data[0].length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder:
                                          (context, animation, secondaryAnimation) {
                                        return MessageComments(
                                          snapshot.data[0][index].id,
                                            widget.group_name,
                                        );
                                      },
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        return FadeTransition(
                                          opacity: animation,
                                          child: child,
                                        );
                                      },
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Stack(
                                    children: <Widget>[
                                      Material(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(50),
                                          topRight: Radius.circular(25),
                                          bottomLeft: Radius.circular(35),
                                          bottomRight: Radius.circular(25),
                                        ),
                                        elevation: 4,
                                        child: Container(
                                          child: ListTile(
                                            trailing: Container(
                                              width: 75,
                                              child: Column(
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 14.0),
                                                    child: Text(
                                                      '${snapshot.data[0][index].created_on}',
                                                      style: TextStyle(
                                                          fontFamily: 'Arial',
                                                          fontSize: 12,
                                                          color: Colors.black38),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            title: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0, bottom: 20),
                                              child: Text(
                                                '${snapshot.data[0][index].poster_name}',
                                                style: TextStyle(
                                                  fontFamily: 'Arial',
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                            subtitle: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Text(
                                                  '${snapshot.data[0][index].content}'),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : Center(child: CircularProgressIndicator());
        });
  }
}
