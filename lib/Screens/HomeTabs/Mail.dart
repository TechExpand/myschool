import 'package:flutter/material.dart';
import 'package:myschool/Screens/CreateGroup.dart';
import 'package:myschool/Screens/GroupMessage.dart';
import 'package:myschool/Services/Network.dart';
import 'package:provider/provider.dart';

class Mail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var webservices = Provider.of<WebServices>(context, listen: false);
    return Stack(
      children: <Widget>[
        FutureBuilder(
            future: webservices.GetGroupBelong(),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                    return GroupsMessage(
                                        snapshot.data[index].group,
                                        snapshot.data[index].name);
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
                            child: Stack(
                              children: <Widget>[
                                Material(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(35),
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
                                              padding: const EdgeInsets.only(
                                                  bottom: 14.0),
                                              child: Text(
                                                '${snapshot.data[index].created_on}',
                                                style: TextStyle(
                                                    color: Colors.black38),
                                              ),
                                            ),
                                            Container(
                                              child: Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(1.0),
                                                  child: Text(
                                                    '5',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.amber,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      title: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 80.0),
                                        child: Text(
                                          '${snapshot.data[index].name}',
                                          style: TextStyle(
                                            fontFamily: 'Arial',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      subtitle: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 80.0),
                                        child: Text('Statistic Assignment'),
                                      ),
                                    ),
                                  ),
                                ),
                                CircleAvatar(
                                  minRadius:
                                      MediaQuery.of(context).size.width / 10.5,
                                  maxRadius:
                                      MediaQuery.of(context).size.width / 10.5,
                                  child:
                                      Image.asset('assets/images/acedemic.png', fit: BoxFit.contain,),
                                  backgroundColor: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : Center(child: CircularProgressIndicator());
            }),
        Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width / 1.3,
                MediaQuery.of(context).size.height / 1.8),
            child: FloatingActionButton(
                backgroundColor: Colors.amber,
                elevation: 5,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return CreateGroups();
                        },
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: Icon(
                    Icons.add,
                    size: 40,
                  ),
                ),
                onPressed: () {})),
      ],
    );
  }
}
