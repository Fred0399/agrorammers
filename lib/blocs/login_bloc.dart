import 'dart:convert';

import 'package:agrorammers/others/urls.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;

class LoginBloc {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: ['email', 'https://www.googleapis.com/auth/contacts.readonly']);

  // StreamController
  final BehaviorSubject<GoogleSignInAccount> _google =
      BehaviorSubject<GoogleSignInAccount>();
  final BehaviorSubject<Map<String,dynamic>> _userInfos =
      BehaviorSubject<Map<String,dynamic>>();

  // Streams
  Stream<GoogleSignInAccount> get googleAccount => _google.stream;
  Stream<Map<String,dynamic>> get userAccount => _userInfos.stream;

  sigInGoogle() async {
    _googleSignIn.signIn().then((GoogleSignInAccount account) async {
      //_google.sink.add(account);
      print(account);
      final response = await http.post(loginApi, body: {'name':account.displayName,'email':account.email,'social_id':account.id,'picture_url':account.photoUrl,});
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return null;
      }
      return extractedData;
    }).then((result) {
      print(result);
      _userInfos.sink.add(result);
    }).catchError((error) {
      print("Error in Login $error");
    });
  }

  signOutGoogle() async {
    _googleSignIn.signOut().then(_google.sink.add);
  }

  dispose() {
    _google.close();
  }
}
