import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../blocs/login_provider.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  PageController _myPage = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final bloc = LoginProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Login screen'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 75,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(left: 28.0),
                icon: Icon(Icons.home),
                onPressed: () {
                  setState(() {
                    _myPage.jumpToPage(0);
                  });
                },
              ),
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(right: 28.0),
                icon: Icon(Icons.search),
                onPressed: () {
                  setState(() {
                    _myPage.jumpToPage(1);
                  });
                },
              ),
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(left: 28.0),
                icon: Icon(Icons.notifications),
                onPressed: () {
                  setState(() {
                    _myPage.jumpToPage(2);
                  });
                },
              ),
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(right: 28.0),
                icon: Icon(Icons.account_circle),
                onPressed: () {
                  setState(() {
                    _myPage.jumpToPage(3);
                  });
                },
              )
            ],
          ),
        ),
      ),
      body: PageView(
        controller: _myPage,
        onPageChanged: (int) {
          print('Page Changes to index $int');
        },
        children: <Widget>[
          Center(
            child: Container(
              child: Text('Empty Body 0'),
            ),
          ),
          Center(
            child: Container(
              child: Text('Empty Body 1'),
            ),
          ),
          Center(
            child: Container(
              child: Text('Empty Body 2'),
            ),
          ),
          Center(
            child: Container(
              child: Text('Empty Body 3'),
            ),
          )
        ],
        physics: NeverScrollableScrollPhysics(), // Comment this if you need to use Swipe.
      ),
      floatingActionButton: Container(
        height: 65.0,
        width: 65.0,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {},
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            // elevation: 5.0,
          ),
        ),
      ),
    );
  }

  Widget _buildGoogleSignInBt(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.googleAccount,
      builder:
          (BuildContext context, AsyncSnapshot<GoogleSignInAccount> snapshot) {
        return RaisedButton(
          child: Text('Login with Google'),
          color: Color(Colors.blueAccent.blue),
          textColor: Colors.white,
          onPressed: !snapshot.hasData
              ? () async {
                  bloc.sigInGoogle();
                }
              : null,
        );
      },
    );
  }

  Widget _buildSignOutBt(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.googleAccount,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return RaisedButton(
            child: Text('Logout'),
            color: Color(Colors.blue.blue),
            textColor: Colors.white,
            onPressed: snapshot.hasData
                ? () async {
                    bloc.signOutGoogle();
                  }
                : null);
      },
    );
  }

  Widget _buildUserInfo(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.googleAccount,
      builder:
          (BuildContext context, AsyncSnapshot<GoogleSignInAccount> snapshot) {
        if (!snapshot.hasData) {
          return Container(
            child: Text('No info!!!'),
          );
        }

        return Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text('Name: '),
                Text(snapshot.data.displayName.toString())
              ],
            ),
            Row(
              children: <Widget>[Text('Email: '), Text(snapshot.data.email)],
            ),
            Row(
              children: <Widget>[Text('Id: '), Text(snapshot.data.id)],
            ),
            Image.network(
              snapshot.data.photoUrl.toString(),
              width: 200.0,
              height: 200.0,
            ),
          ],
        );
      },
    );
  }
}
