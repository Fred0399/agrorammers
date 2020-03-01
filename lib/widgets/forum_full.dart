import 'package:agrorammers/blocs/forum_bloc.dart';
import 'package:agrorammers/data/forum.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForumFull extends StatefulWidget {
  static const String routeName = "/formFullState";
  Forum forum;
  var _isLoading = false;
  var _isInit = true;
  var userID;
  List<Comment> list = [];
  ForumFull({this.forum});
  @override
  _ForumFullState createState() => _ForumFullState();
}

class _ForumFullState extends State<ForumFull> {
  TextEditingController _textFieldBodyController = TextEditingController();

  @override
  void didChangeDependencies() {
    if (widget._isInit) {
      widget.forum = ModalRoute.of(context).settings.arguments as Forum;
      ForumBloc().getComment(widget.forum.id).then((result) {
        setState(() {
          widget._isLoading = false;
          widget.list = result;
        });
      }).catchError((error) {
        print(error);
      });
    }
    widget._isInit = false;
    widget._isLoading = true;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    widget.forum = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Forum"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              form(widget.forum, screenSize),
              SizedBox(
                height: 7,
              ),
              Container(
                child: Center(
                  child: Text(
                    "Şərhlər",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              formBody(screenSize),
              SizedBox(
                height: 2,
              ),
              additionComment(screenSize),
            ],
          ),
        ),
      ),
    );
  }

  Widget formBody(Size screenSize) {
    return Container(
      width: screenSize.width * 0.90,
      height: screenSize.height * 0.4,
      child: ListView(
        shrinkWrap: true,
        children: widget.list.map(
          (val) {
            return comment(val, screenSize);
          },
        ).toList(),
      ),
    );
  }

  Widget comment(Comment comment, Size screenSize) {
    return Container(
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
                  image: (comment.commentUserProfIMg != null)
                      ? new NetworkImage(comment.commentUserProfIMg)
                      : new AssetImage("assets/ui_icons/user.png"),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: screenSize.width * 0.70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    comment.commentBody,
                    maxLines: 10,
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "Yazdı:${comment.commentUserName}",
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
    );
  }

  Widget additionComment(Size screenSize) {
    return Container(
      width: screenSize.width * 0.90,
      height: screenSize.height * 0.20,
      child: Column(
        children: [
          TextField(
            keyboardType: TextInputType.multiline,
            maxLines: 2,
            controller: _textFieldBodyController,
            decoration: InputDecoration(
              //Add th Hint text here.
              hintText: "Şərhinizi yazın...",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          Container(
            width: screenSize.width * 0.90,
            alignment: Alignment.centerRight,
            margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: RaisedButton(
              child: Text(
                "Göndər",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                ForumBloc()
                    .addComment(_textFieldBodyController.text, widget.forum.id,
                        widget.forum.userID)
                    .then((val) {
                  if (val) {
                    setState(() {
                      widget._isLoading = true;
                    });
                    ForumBloc().getComment(widget.forum.id).then((res) {
                      setState(() {
                        widget.list = res;
                        widget._isLoading = false;
                      });
                    }).catchError((error) {
                      print(error);
                    });
                    toast("Göndərildi!");
                    _textFieldBodyController.text = "";
                  } else {
                    toast("Xəta!");
                    _textFieldBodyController.text = "";
                  }
                }).catchError((error) {
                  print(error);
                });
              },
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget form(Forum forum, Size screenSize) {
    return Card(
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
                  maxLines: 10,
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
    );
  }

  void toast(String strg) {
    Fluttertoast.showToast(
      msg: strg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIos: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
