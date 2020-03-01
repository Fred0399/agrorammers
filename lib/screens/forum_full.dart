import 'package:agrorammers/data/forum.dart';
import 'package:flutter/material.dart';

class ForumFull extends StatefulWidget {
  static const String routeName = "/formFullState";
  Forum forum;
  ForumFull({this.forum});
  @override
  _ForumFullState createState() => _ForumFullState();
}

class _ForumFullState extends State<ForumFull> {
  TextEditingController _textFieldControllerContent = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    widget.forum = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text("Forum"),),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              formHead(screenSize),
              SizedBox(
                height: 7,
              ),
              // formBody(screenSize),
            ],
          ),
        ),
      ),
    );
  }

  // Widget formBody(Size screenSize) {
  //   return Container(
  //     width: screenSize.width * 0.90,
  //     height: screenSize.height * 0.43,
  //     child: ListView(
  //       shrinkWrap: true,
  //       children: widget.forum.comments.map(
  //         (val) {
  //           return form(val, screenSize);
  //         },
  //       ).toList(),
  //     ),
  //   );
  // }

  // Widget form(Comment comment, Size screenSize) {
  //   return Container(
  //     width: screenSize.width * 0.90,
  //     height: screenSize.height * 0.15,
  //     child: Card(
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(15.0),
  //       ),
  //       elevation: 5,
  //       child: Row(
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: <Widget>[
  //           SizedBox(
  //             width: 10,
  //           ),
  //           Container(
  //             width: screenSize.height * 0.05,
  //             height: screenSize.height * 0.05,
  //             decoration: BoxDecoration(
  //               shape: BoxShape.circle,
  //               image: new DecorationImage(
  //                 image: (forum.userPicUrl != null)
  //                     ? new NetworkImage(forum.userPicUrl)
  //                     : new AssetImage("assets/ui_icons/user.png"),
  //               ),
  //             ),
  //           ),
  //           SizedBox(
  //             width: 10,
  //           ),
  //           Container(
  //             width: screenSize.width * 0.60,
  //             height: screenSize.height * 0.20,
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //               children: <Widget>[
  //                 Text(
  //                   forum.userName,
  //                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
  //                 ),
  //                 Text(
  //                   forum.body,
  //                   overflow: TextOverflow.ellipsis,
  //                 )
  //               ],
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget formHead(Size screenSize) {
    return Container(
      width: screenSize.width * 0.90,
      height: screenSize.height * 0.30,
      child: Card(
        child: Column(
          children: [
            Card(),
            Container(
              width: screenSize.width * 0.90,
              child: Card(
                child: Text(widget.forum.body),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
