import 'package:agrorammers/blocs/forum_bloc.dart';
import 'package:agrorammers/data/forum.dart';
import 'package:agrorammers/data/user.dart';
import 'package:agrorammers/widgets/forum_full.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForumHome extends StatefulWidget {
  User user;

  List<Forum> listForum;

  ForumHome(this.user);
  var _isLoading = false;
  var _isInit = true;
  @override
  _ForumHomeState createState() => _ForumHomeState();
}

class _ForumHomeState extends State<ForumHome> {
  TextEditingController _textFieldControllerContent = TextEditingController();
  TextEditingController _textFieldTitleController = TextEditingController();

  @override
  void didChangeDependencies() {
    if (widget._isInit) {
      // widget.user = ModalRoute.of(context).settings.arguments as User;
      ForumBloc().getForums().then((result) {
        setState(() {
          widget._isLoading = false;
          widget.listForum = result;
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
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: (widget._isLoading)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
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
      height: screenSize.height * 0.35,
      child: (widget.listForum != null)
          ? ListView(
              shrinkWrap: true,
              children: widget.listForum.map(
                (val) {
                  return form(val, screenSize);
                },
              ).toList(),
            )
          : Center(
              child: Text("Məlumat yoxdur!"),
            ),
    );
  }

  Widget form(Forum forum, Size screenSize) {
    return GestureDetector(
      onTap: () {
        forum.userID = widget.user.id;
        Navigator.of(context).pushNamed(
          ForumFull.routeName,
          arguments: forum,
        );
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
                      overflow: TextOverflow.ellipsis,
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
                    ForumBloc()
                        .addForum(_textFieldTitleController.text,
                            _textFieldControllerContent.text, widget.user.id)
                        .then((val) {
                      if (val) {
                        setState(() {
                          widget._isLoading = true;
                        });
                        ForumBloc().getForums().then((res) {
                          setState(() {
                            widget.listForum = res;
                            widget._isLoading = false;
                          });
                        }).catchError((error) {
                          print(error);
                        });
                        toast("Göndərildi!");
                        _textFieldControllerContent.text = "";
                        _textFieldTitleController.text = "";
                      } else {
                        toast("Xəta!");
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
