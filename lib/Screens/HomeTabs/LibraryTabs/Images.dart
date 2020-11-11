import 'package:flutter/material.dart';
import 'package:myschool/Screens/CreateGroup.dart';
import 'package:myschool/Screens/GroupMessage.dart';
import 'package:myschool/Services/Network.dart';
import 'package:provider/provider.dart';

class Images extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var webservices = Provider.of<WebServices>(context, listen: false);
    return Stack(
      children: <Widget>[
        FutureBuilder(
            future: webservices.GetLibraryImage(),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? ListView.builder(
                      itemCount:
                          snapshot.data == null ? 0 : snapshot.data.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 2,
                            child: ListTile(
                              leading: Container(
                                  height: 100,
                                  child: Image.network(
                                      '${snapshot.data[index].files}')),
                              title: Text(
                                '${snapshot.data[index].file_name}',
                                softWrap: true,
                                maxLines: 2,
                                overflow: TextOverflow.fade,
                              ),
                              trailing: FlatButton(
                                onPressed: () {},
                                color: Colors.amber,
                                child: Text(
                                  'Download',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : Center(child: CircularProgressIndicator());
            }),
      ],
    );
  }
}
