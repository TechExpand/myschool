import 'package:flutter/material.dart';
import 'package:myschool/Services/Network.dart';
import 'package:myschool/Utils/utils.dart';
import 'dart:ui' as ui;

import 'package:provider/provider.dart';

class CreateGroups extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  var name;
  var description;
  var pro_pic;
  var admin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: Consumer2<WebServices, Utils>(
          builder: (context, webservices, utils, child) =>
              SingleChildScrollView(
                  child: Form(
            key: _formkey,
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
                                top: MediaQuery.of(context).size.width / 8,
                                left: MediaQuery.of(context).size.width / 20),
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ))),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                          child: Padding(
                        padding: EdgeInsets.only(top: 90.0, left: 8, right: 8),
                        child: Text(
                          'CREATE GROUP',
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
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    width: 480,
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Group Name is Required';
                        } else {
                          name = value;
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: 'Group Name',
                          labelStyle: TextStyle(
                            color: Colors.black87,
                          ),
                          icon: Icon(
                            Icons.title,
                            color: Colors.black87,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    width: 480,
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Group Description is Required';
                        } else {
                          description = value;
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: 'Group Description',
                          labelStyle: TextStyle(
                            color: Colors.black87,
                          ),
                          icon: Icon(
                            Icons.title,
                            color: Colors.black87,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                ),
                Divider(),
                Container(
                  width: 170,
                  height: 170,
                  child: utils.selected_image == null
                      ? Center(
                          child: Text('No Image Selected'),
                        )
                      : Image.file(
                          utils.selected_image,
                          fit: BoxFit.contain,
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      color: Colors.black87,
                      onPressed: () {
                        utils.selectimage();
                      },
                      child: Text(
                        'Select Group Image',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Divider(),
                webservices.login_state == false
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          onPressed: () {
                            if (_formkey.currentState.validate()) {
                              webservices.Login_SetState();
                              webservices.Create_Group(
                                name: name,
                                description: description,
                                pro_pic: utils.selected_image.path,
                                context: context,
                              );
                              print(description.toString());
                            }
                          },
                          child: Text(
                            'Create Group',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.blue,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      ),
              ],
            ),
          )),
        ));
  }
}
