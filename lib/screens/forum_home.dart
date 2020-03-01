import 'package:agrorammers/data/forum.dart';
import 'package:agrorammers/data/user.dart';
import 'package:agrorammers/screens/forum_full.dart';
import 'package:flutter/material.dart';

class ForumHome extends StatefulWidget {
  final User user;

  List<Forum> listForum = [
    Forum(
      userName: "Farid Jafarov",
      userPicUrl: null,
      title: "NArohodoooo",
      id: 1,
      userID: 1,
      body: "Lorem ipsum ipsum lorem lorem ipsum lorem",
    ),
  ];

  ForumHome(this.user);

  @override
  _ForumHomeState createState() => _ForumHomeState();
}

class _ForumHomeState extends State<ForumHome> {
  TextEditingController _textFieldControllerContent = TextEditingController();
  TextEditingController _textFieldTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
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
            formBody(screenSize),
          ],
        ),
      ),
    );
  }

  Widget formBody(Size screenSize) {
    return Container(
      width: screenSize.width * 0.90,
      height: screenSize.height * 0.43,
      child: ListView(
        shrinkWrap: true,
        children: widget.listForum.map(
          (val) {
            return form(val, screenSize);
          },
        ).toList(),
      ),
    );
  }

  Widget form(Forum forum, Size screenSize) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(ForumFull.routeName,arguments: forum);
      },
      child: Container(
        width: screenSize.width * 0.90,
        height: screenSize.height * 0.15,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 5,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 10,
              ),
              Container(
                width: screenSize.height * 0.05,
                height: screenSize.height * 0.05,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                    image: (forum.userPicUrl != null)
                        ? new NetworkImage(forum.userPicUrl)
                        : new AssetImage("assets/ui_icons/user.png"),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: screenSize.width * 0.70,
                height: screenSize.height * 0.20,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      forum.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      forum.body,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "Yazdı:${forum.userName}",
                        textAlign: TextAlign.end,
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget formHead(Size screenSize) {
    return Container(
      width: screenSize.width * 0.90,
      height: screenSize.height * 0.40,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 1,
              controller: _textFieldTitleController,
              decoration: InputDecoration(
                //Add th Hint text here.
                hintText: "Başlıq daxil edin...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              controller: _textFieldControllerContent,
              decoration: InputDecoration(
                //Add th Hint text here.
                hintText: "Mətn daxil edin...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RaisedButton(
                  child: Text(
                    "Göndər",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    //send forum
                  },
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                RaisedButton(
                  child: Text(
                    "Ləğv et",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    setState(() {
                      _textFieldControllerContent.text = "";
                      _textFieldTitleController.text = "";
                    });
                  },
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
