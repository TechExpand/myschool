//
//import 'package:flutter/material.dart';
//
//class Discussion extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Stack(
//      children: <Widget>[
//        ListView.builder(
//          itemCount: 15,
//         itemBuilder: (context, index){
//         return  Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Stack(
//               children: <Widget>[
//                 Material(
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(39),
//                     topRight: Radius.circular(25),
//                     bottomLeft: Radius.circular(39),
//                     bottomRight: Radius.circular(25),
//                   ),
//                   elevation: 4,
//                   child: Container(
//                     child: ListTile(
//                       trailing: Container(
//                         width: 75,
//                         child: Column(
//                           children: <Widget>[
//                             Padding(
//                               padding: const EdgeInsets.only(bottom: 14.0),
//                               child: Text(
//                                 '18/08/2016',
//                                 style: TextStyle(color: Colors.black38),
//                               ),
//                             ),
//                             Expanded(
//                               child: Container(
//                                 child: Center(
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(1.0),
//                                     child: Text(
//                                       '5',
//                                       style: TextStyle(color: Colors.white),
//                                     ),
//                                   ),
//                                 ),
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: Colors.amber,
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                       title: Padding(
//                         padding: const EdgeInsets.only(left: 80.0),
//                         child: Text(
//                           '400LVL BCH DISCUSS',
//                           style: TextStyle(
//                             fontFamily: 'Arial',
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                           ),
//                         ),
//                       ),
//                       subtitle: Padding(
//                         padding: const EdgeInsets.only(left: 80.0),
//                         child: RichText(
//                           text: TextSpan(children: <TextSpan>[
//                             TextSpan(
//                                 text: 'bright: ',
//                                 style: TextStyle(
//                                     color: Colors.black38,
//                                     fontWeight: FontWeight.bold)),
//                             TextSpan(
//                                 text: 'Hey how are you',
//                                 style: TextStyle(color: Colors.black38))
//                           ]),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 CircleAvatar(
//                   minRadius: MediaQuery.of(context).size.width / 8.2,
//                   maxRadius: MediaQuery.of(context).size.width / 8.2,
//                   child: Image.asset('assets/images/acedemic.png'),
//                   backgroundColor: Colors.grey,
//                 ),
//               ],
//             ),
//           );
//         },
//        ),
//        Transform.translate(
//            offset: Offset(
//                MediaQuery.of(context).size.width / 1.3,
//                MediaQuery.of(context).size.height / 1.8
//            ),
//            child: FloatingActionButton(
//                backgroundColor: Colors.amber,
//                elevation: 5,
//                child: Icon(
//                  Icons.add,
//                  size: 40,
//                ),
//                onPressed: () {})),
//      ],
//    );
//  }
//}
//
//
