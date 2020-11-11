import 'package:flutter/material.dart';
import 'package:myschool/Screens/HomePage.dart';
import 'package:myschool/Services/Network.dart';
import 'package:provider/provider.dart';

class SearchGroups extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SearchGroupState();
  }
}

class SearchGroupState extends State<SearchGroups> {
  String search_group = '';
  var data;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ))),
          iconTheme: IconThemeData(color: Colors.white),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return SearchGroups();
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
              ),
            ),
          ],
          backgroundColor: Colors.lightBlueAccent,
          title: Text('MYCLAS',
              style: TextStyle(
                color: Colors.white,
              )),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: 400,
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      search_group = value;
                      Results(search_group);
                    });
                  },
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: 'Search for Groups',
                      labelStyle: TextStyle(
                        color: Colors.black87,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black87,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Search Result',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Expanded(child: Builder(
              builder: (context) {
                return Results(search_group);
              },
            ))
          ],
        ),
    );
  }
}


class Results extends StatefulWidget{
  var search_group;

  Results(this.search_group);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ResultState();
  }
}

class ResultState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    var webservices = Provider.of<WebServices>(context, listen: false);
    // TODO: implement build
    return FutureBuilder(
        future: webservices.GroupSearch(widget.search_group),
        builder: (context, snapshot) {
          var webservices = Provider.of<WebServices>(context, listen: false);
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 3,
                      child: ListTile(
                        trailing: Flexible(
                          child: webservices.login_state == false
                              ? InkWell(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 10.0),
                                    child: Icon(
                                      Icons.add_comment,
                                      color: Colors.blue,
                                      size: 40,
                                    ),
                                  ),
                                  onTap: () {
                                    webservices.JoinGroup(
                                      context: context,
                                      group_name: snapshot.data[index].name,
                                      id: snapshot.data[index].id,
                                    ).then((value) {
                                      setState(() {

                                      });
                                    });;
                                    webservices.Login_SetState();
                                  },
                                )
                              : CircularProgressIndicator(),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(
                              top: 3.0, left: 7, right: 3, bottom: 3),
                          child: Flexible(
                            child: Text(
                              '${snapshot.data[index].name}',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 18),
                            ),
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 3.0, left: 7, right: 3, bottom: 3),
                              child: Text(
                                '${snapshot.data[index].description}',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 18),
                                softWrap: false,
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  })
              : Center(child: CircularProgressIndicator());
        });
  }
}
