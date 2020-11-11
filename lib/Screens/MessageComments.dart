import 'package:flutter/material.dart';
import 'package:myschool/Services/Network.dart';
import 'package:myschool/Utils/enum.dart';
import 'package:myschool/Utils/utils.dart';
import 'dart:ui' as ui;

import 'package:provider/provider.dart';

class MessageComments extends StatefulWidget {
  int id;
  String group_name;

  MessageComments(this.id, this.group_name);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MessageCommentsState();
  }
}

class MessageCommentsState extends State<MessageComments> {
  final formkey = GlobalKey<FormState>();
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
                  padding: const EdgeInsets.all(1),
                  child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: Form(
                      key: formkey,
                      child: KeepAlive(
                        keepAlive: true,
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'comment is Required';
                            } else {
                              content = value;
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              labelText: 'Send Comment',
                              labelStyle: TextStyle(
                                color: Colors.black87,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
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
                            webservices.Create_Commnet(
                              context: context,
                              content: content,
                              message: widget.id,
                            ).then((value) {
                              setState(() {
                                MessageCommentsState();
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
      body: CommentBody(context),
    );
  }

  Widget CommentBody(context) {
    var webservices = Provider.of<WebServices>(context, listen: false);
    return FutureBuilder(
        future: Future.wait(
            [webservices.GetMessageComment(widget.id), webservices.GetProfile()]),
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
                              '${widget.group_name.toString()}' + ' comment',
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
                        return Padding(
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
                                                  color: Colors.black38),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    title: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 80.0, bottom: 20),
                                      child: Text(
                                        '${snapshot.data[0][index].poster_name}',
                                        style: TextStyle(
                                          fontFamily: 'Arial',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 80.0),
                                      child: Text(
                                          '${snapshot.data[0][index].content}'),
                                    ),
                                  ),
                                ),
                              ),
                              CircleAvatar(
                                minRadius:
                                MediaQuery.of(context).size.width /
                                    10.5,
                                maxRadius:
                                MediaQuery.of(context).size.width /
                                    10.5,
                                child: Image.asset(
                                  'assets/images/acedemic.png', fit: BoxFit.contain,),
                                backgroundColor: Colors.grey,
                              ),
                            ],
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
