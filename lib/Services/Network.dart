import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:myschool/Models/Comment.dart';
import 'package:myschool/Models/GroupBelong.dart';
import 'package:myschool/Models/GroupMessage.dart';
import 'package:myschool/Models/Groups.dart';
import 'package:myschool/Models/Library.dart';
import 'package:myschool/Models/Profile.dart';
import 'package:myschool/Screens/HomePage.dart';
import 'package:myschool/Screens/SearchGroups.dart';
import 'package:myschool/main.dart';
import 'package:provider/provider.dart';

class WebServices extends ChangeNotifier {
  var login_state = false;
  var create_group_res;

  void Login_SetState() {
    if (login_state == false) {
      login_state = true;
    } else {
      login_state = false;
    }
    notifyListeners();
  }

  Future GetProfile() async {
    try {
      var res = await http.get(
          Uri.encodeFull('http://192.168.43.231:8000/myclas/users/me/'),
          headers: {
            "Accept": "application/json",
            "Authorization": "Token b898350d5171c1523cb439fde8bc08765b9e5403"
          });
      if (res.statusCode == 200) {
        var body = jsonDecode(res.body);
        var profile = Profile.fromJson(body);
        return profile;
      } else {
        throw 'Cant get profile';
      }
    } catch (e) {
      print('Cant get profile');
      print(e);
    }
  }

  Future GetGroupBelong() async {
    try {
      var res = await http.get(
          Uri.encodeFull('http://192.168.43.231:8000/myclas/groupsbelong/'),
          headers: {
            "Accept": "application/json",
            "Authorization": "Token b898350d5171c1523cb439fde8bc08765b9e5403"
          });
      if (res.statusCode == 200) {
        var body = jsonDecode(res.body) as List;
        List<GroupBelong> group_belong_objects = body
            .map((group_belong_json) => GroupBelong.fromJson(group_belong_json))
            .toList();
        return group_belong_objects;
      } else {
        throw 'Cant get groups';
      }
    } catch (e) {
      print('Cant get groups');
      print(e);
    }
  }

  Future GetLibraryDoc() async {
    try {
      var res = await http.get(
          Uri.encodeFull('http://192.168.43.231:8000/myclas/doc/'),
          headers: {
            "Accept": "application/json",
            "Authorization": "Token b898350d5171c1523cb439fde8bc08765b9e5403"
          });
      if (res.statusCode == 200) {
        var body = jsonDecode(res.body) as List;
        List<Library> library_doc_objects = body
            .map((library_doc_json) => Library.fromJson(library_doc_json))
            .toList();
        return library_doc_objects;
      } else {
        throw 'Cant get Docs';
      }
    } catch (e) {
      print('Cant get Docs');
      print(e);
    }
  }

  Future GetLibraryVideo() async {
    try {
      var res = await http.get(
          Uri.encodeFull('http://192.168.43.231:8000/myclas/video/'),
          headers: {
            "Accept": "application/json",
            "Authorization": "Token b898350d5171c1523cb439fde8bc08765b9e5403"
          });
      if (res.statusCode == 200) {
        var body = jsonDecode(res.body) as List;
        List<Library> library_video_objects = body
            .map((library_video_json) => Library.fromJson(library_video_json))
            .toList();
        return library_video_objects;
      } else {
        throw 'Cant get Video';
      }
    } catch (e) {
      print('Cant get Video');
      print(e);
    }
  }

  Future GetLibraryImage() async {
    try {
      var res = await http.get(
          Uri.encodeFull('http://192.168.43.231:8000/myclas/image/'),
          headers: {
            "Accept": "application/json",
            "Authorization": "Token b898350d5171c1523cb439fde8bc08765b9e5403"
          });
      if (res.statusCode == 200) {
        var body = jsonDecode(res.body) as List;
        List<Library> library_image_objects = body
            .map((library_image_json) => Library.fromJson(library_image_json))
            .toList();
        return library_image_objects;
      } else {
        throw 'Cant get Image';
      }
    } catch (e) {
      print('Cant get Image');
      print(e);
    }
  }

  Future GetGroupMessage(id) async {
    try {
      var res = await http.get(
          Uri.encodeFull(
              'http://192.168.43.231:8000/myclas/groupmessage/${id}/'),
          headers: {
            "Accept": "application/json",
            "Authorization": "Token b898350d5171c1523cb439fde8bc08765b9e5403"
          });
      if (res.statusCode == 200) {
        var body = jsonDecode(res.body) as List;
        List<GroupMessage> group_message_objects = body
            .map((group_message_json) =>
                GroupMessage.fromJson(group_message_json))
            .toList();
        print(group_message_objects);
        return group_message_objects;
      } else {
        throw 'Cant get group message';
      }
    } catch (e) {
      print('Cant get group message');
      print(e);
    }
  }

  Future GetMessageComment(id) async {
    try {
      var res = await http.get(
          Uri.encodeFull(
              'http://192.168.43.231:8000/myclas/comments/${id}/'),
          headers: {
            "Accept": "application/json",
            "Authorization": "Token b898350d5171c1523cb439fde8bc08765b9e5403"
          });
      if (res.statusCode == 200) {
        var body = jsonDecode(res.body) as List;
        List<GroupComment> message_comment_objects = body
            .map((message_comment_json) =>
                GroupComment.fromJson(message_comment_json))
            .toList();
        print(message_comment_objects);
        return message_comment_objects;
      } else {
        throw 'Cant get message comment';
      }
    } catch (e) {
      print('Cant get message comment');
      print(e);
    }
  }

  Future GroupSearch(search) async {
    try {
      var res = await http.get(
          Uri.encodeFull(
              'http://192.168.43.231:8000/myclas/groups/?search=${search.toString()}'),
          headers: {
            "Accept": "application/json",
            "Authorization": "Token b898350d5171c1523cb439fde8bc08765b9e5403"
          });
      if (res.statusCode == 200) {
        var body = jsonDecode(res.body) as List;
        List<Group> group_objects =
            body.map((group_json) => Group.fromJson(group_json)).toList();
        print(group_objects);
        return group_objects;
      } else {
        throw 'Cant get groups';
      }
    } catch (e) {
      print('Cant get groups');
      print(e);
    }
  }

  Future Create_Group({name, description, pro_pic, context}) async {
    try {
      var upload = http.MultipartRequest(
          'POST', Uri.parse('http://192.168.43.231:8000/myclas/groups/'));
      var file = await http.MultipartFile.fromPath('pro_pic', pro_pic);
      upload.files.add(file);
      upload.fields['name'] = name.toString();
      upload.fields['description'] = description.toString();
      upload.fields['admin'] = 'True';
      upload.headers['authorization'] =
          "Token b898350d5171c1523cb439fde8bc08765b9e5403";

      final stream = await upload.send();
      create_group_res = await http.Response.fromStream(stream);
      var body = jsonDecode(create_group_res.body);
      if (create_group_res.statusCode == 200 ||
          create_group_res.statusCode == 201) {
        Login_SetState();
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return SearchGroups();
        }));
      } else if (create_group_res.statusCode == 400) {
        Login_SetState();
        showDialog(
            child: AlertDialog(
              title: Center(
                child: Text('Check Input Details',
                    style: TextStyle(color: Colors.blue)),
              ),
            ),
            context: context);
      }
      return create_group_res;
    } catch (e) {
      print(e);
      Login_SetState();
      showDialog(
          child: AlertDialog(
            title: Center(
              child:
                  Text('Working on it', style: TextStyle(color: Colors.blue)),
            ),
            content: Text('There was a Problem Encountered'),
          ),
          context: context);
    }
  }

  Future Create_Messege({content, poster_name, files, group, context}) async {
    try {
      var upload = http.MultipartRequest(
          'POST', Uri.parse('http://192.168.43.231:8000/myclas/message/'));
//      var file = await http.MultipartFile.fromPath('files', files);
//      upload.files.add(file);
      upload.fields['content'] = content.toString();
      upload.fields['poster_name'] = poster_name.toString();
      upload.fields['created_on'] = '';
      upload.fields['group'] = group.toString();
      upload.headers['authorization'] =
          "Token b898350d5171c1523cb439fde8bc08765b9e5403";

      final stream = await upload.send();
      create_group_res = await http.Response.fromStream(stream);
      var body = jsonDecode(create_group_res.body);
      if (create_group_res.statusCode == 200 ||
          create_group_res.statusCode == 201) {
        Login_SetState();
        print('sent');
      } else if (create_group_res.statusCode == 400) {
        Login_SetState();
        showDialog(
            child: AlertDialog(
              title: Center(
                child: Text('Check Input Details',
                    style: TextStyle(color: Colors.blue)),
              ),
            ),
            context: context);
      }
      return create_group_res;
    } catch (e) {
      print(e);
      Login_SetState();
      showDialog(
          child: AlertDialog(
            title: Center(
              child:
                  Text('Working on it', style: TextStyle(color: Colors.blue)),
            ),
            content: Text('There was a Problem Encountered'),
          ),
          context: context);
    }
  }



  Future Create_Commnet({content, poster_name, message, context,}) async {
    try {
      var upload = http.MultipartRequest(
          'POST', Uri.parse('http://192.168.43.231:8000/myclas/comments/${message}/'));
      upload.fields['content'] = content.toString();
      upload.fields['poster_name'] = '';
      upload.fields['created_on'] = '';
      upload.fields['message'] = message.toString();
      upload.headers['authorization'] =
      "Token b898350d5171c1523cb439fde8bc08765b9e5403";

      final stream = await upload.send();
      create_group_res = await http.Response.fromStream(stream);
      var body = jsonDecode(create_group_res.body);
      if (create_group_res.statusCode == 200 ||
          create_group_res.statusCode == 201) {
        Login_SetState();
        print('sent');
      } else if (create_group_res.statusCode == 400) {
        Login_SetState();
        showDialog(
            child: AlertDialog(
              title: Center(
                child: Text('Check Input Details',
                    style: TextStyle(color: Colors.blue)),
              ),
            ),
            context: context);
      }
      return create_group_res;
    } catch (e) {
      print(e);
      Login_SetState();
      showDialog(
          child: AlertDialog(
            title: Center(
              child:
              Text('Working on it', style: TextStyle(color: Colors.blue)),
            ),
            content: Text('There was a Problem Encountered'),
          ),
          context: context);
    }
  }





  Future JoinGroup({group_name, id, context}) async {
    try {
      var upload = http.MultipartRequest(
          'POST', Uri.parse('http://192.168.43.231:8000/myclas/groupsbelong/'));
      upload.fields['name'] = group_name.toString();
      upload.fields['group'] = id.toString();
      upload.fields['created_on'] = '';
      upload.fields['user'] = '';
      upload.headers['authorization'] =
          "Token b898350d5171c1523cb439fde8bc08765b9e5403";
      final stream = await upload.send();
      var join_group_res = await http.Response.fromStream(stream);
      var body = jsonDecode(join_group_res.body);
      if (join_group_res.statusCode == 200 ||
          join_group_res.statusCode == 201) {
        Login_SetState();
        print(join_group_res.body);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return MyApp();
        }));
      } else if (join_group_res.statusCode == 400) {
        Login_SetState();
        showDialog(
            child: AlertDialog(
              title: Center(
                child:
                    Text('Faid to Join', style: TextStyle(color: Colors.blue)),
              ),
            ),
            context: context);
      }
      return join_group_res;
    } catch (e) {
      print(e);
      Login_SetState();
      showDialog(
          child: AlertDialog(
            title: Center(
              child:
                  Text('Working on it', style: TextStyle(color: Colors.blue)),
            ),
            content: Text('There was a Problem Encountered'),
          ),
          context: context);
    }
  }

  Future Create_Messege_File(
      {content, poster_name, files, group, context}) async {
    try {
      var upload = http.MultipartRequest(
          'POST', Uri.parse('http://192.168.43.231:8000/myclas/message/'));
      var file = await http.MultipartFile.fromPath('files', files);
      upload.files.add(file);
      upload.headers['authorization'] =
          "Token b898350d5171c1523cb439fde8bc08765b9e5403";

      final stream = await upload.send();
      create_group_res = await http.Response.fromStream(stream);
      var body = jsonDecode(create_group_res.body);
      if (create_group_res.statusCode == 200 ||
          create_group_res.statusCode == 201) {
        Login_SetState();
        print('sent');
      } else if (create_group_res.statusCode == 400) {
        Login_SetState();
        showDialog(
            child: AlertDialog(
              title: Center(
                child: Text('Check File', style: TextStyle(color: Colors.blue)),
              ),
            ),
            context: context);
      }
      return create_group_res;
    } catch (e) {
      print(e);
      Login_SetState();
      showDialog(
          child: AlertDialog(
            title: Center(
              child:
                  Text('Working on it', style: TextStyle(color: Colors.blue)),
            ),
            content: Text('There was a Problem Encountered'),
          ),
          context: context);
    }
  }
}
