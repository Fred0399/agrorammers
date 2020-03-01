import 'package:agrorammers/blocs/search_user_bloc.dart';
import 'package:agrorammers/data/user.dart';
import 'package:agrorammers/others/urls.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/services.dart';

class PopUP {
  final int plantID;
  PopUP({this.plantID});

  TextEditingController _textFieldControllerEmail = TextEditingController();
  var alertStyle = AlertStyle(
    animationType: AnimationType.grow,
    isOverlayTapDismiss: false,
    descStyle: TextStyle(fontWeight: FontWeight.bold),
    animationDuration: Duration(milliseconds: 400),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      side: BorderSide(
        color: Colors.grey,
      ),
    ),
  );

  Widget textFieldsCustomized({
    TextEditingController localTextEdit,
    String hintTextt,
    String labelTextt,
    int defTextFieldType,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(labelTextt, style: TextStyle(color: Colors.grey, fontSize: 15)),
          SizedBox(
            height: 6,
          ),
          TextField(
            controller: localTextEdit,
            keyboardType: (defTextFieldType == 0)
                ? TextInputType.emailAddress
                : (defTextFieldType == 1) ? TextInputType.multiline : null,
            decoration: InputDecoration(
              //Add th Hint text here.
              hintText: hintTextt,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            maxLines: (defTextFieldType == 1) ? 4 : 1,
          ),
        ],
      ),
    );
  }

  Widget userBox(User user, Size screenSize) {
    return Container(
        width: screenSize.width * 0.9,
        height: screenSize.height * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(user.name),
            Container(
              width: screenSize.height * 0.1,
              height: screenSize.height * 0.1,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      image: new NetworkImage(user.imageUrl))),
            )
          ],
        ),
    );
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Email adressi doğru daxil edilməyib!';
    else
      return null;
  }

  void showAlertUsers(BuildContext context, List<User> list, int plantId) {
    Size sizee = MediaQuery.of(context).size;
    Alert(
      context: context,
      style: alertStyle,
      title: "",
      content: Container(
        width: sizee.width * 90 / 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: list.map((val) {
            return userBox(val, sizee);
          }).toList(),
        ),
      ),
      buttons: [
        DialogButton(
          onPressed: () {
            SearchUser().addMember(list[0].socialId,plantId).then((res){
              if(res!=null && res['status']=="success"){
                toast("İstifadəçi əlavə edildi!");
              }
            }).catchError((error){
              toast("Xəta!");
            });
          },
          child: Text(
            "ƏLAVƏ ET",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }

  void showAlertCustom(BuildContext context, int plantID) {
    Alert(
      context: context,
      style: alertStyle,
      title: "",
      content: Container(
        width: MediaQuery.of(context).size.width * 90 / 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            textFieldsCustomized(
              localTextEdit: _textFieldControllerEmail,
              hintTextt: "Email ünvanı daxil edin",
              labelTextt: "Email",
              defTextFieldType: 0,
            ),
          ],
        ),
      ),
      buttons: [
        DialogButton(
          onPressed: () {
            final String _valueStr =
                validateEmail(_textFieldControllerEmail.text);
            if (_valueStr != null) {
              Fluttertoast.showToast(
                msg: _valueStr,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIos: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0,
              );
              return;
            }
            SearchUser()
                .searchUser(_textFieldControllerEmail.text)
                .then((userData) {
              showAlertUsers(context, userData, plantID);
            }).catchError((error) {
              toast(error.toString());
            });
          },
          child: Text(
            "GÖNDƏR",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
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
