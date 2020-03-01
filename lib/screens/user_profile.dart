import 'package:agrorammers/data/user.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  User userData;
  UserProfile({this.userData});
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Container(
            width: screenSize.width * 0.92,
            height: screenSize.height * 0.25,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 2.5,
              child: Row(
                children: <Widget>[
                  Container(
                    height: screenSize.height * 0.25,
                    width: screenSize.width * 0.65,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "İstifadəçi:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(widget.userData.name)
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 15,
                            ),
                            Text("Email:",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(widget.userData.email)
                          ],
                        )
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: (widget.userData.imageUrl != null)
                        ? Image.network(
                            widget.userData.imageUrl,
                            height: screenSize.height * 0.125,
                            width: screenSize.height * 0.125,
                          )
                        : Image.asset(
                            "assets/ui_icons/user.png",
                            height: screenSize.height * 0.125,
                            width: screenSize.height * 0.125,
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
