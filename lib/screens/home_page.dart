import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../blocs/login_provider.dart';
import '../others/drawer.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  int choosedind = 0;
  String appBarTitle = "Sahəm";
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
        title: Text(widget.appBarTitle),
      ),
      drawer: DrawerPg(logout: null),
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
                color: (widget.choosedind == 0) ? Colors.green : Colors.black,
                onPressed: () {
                  setState(() {
                    widget.choosedind = 0;
                    widget.appBarTitle = "Sahəm";
                    _myPage.jumpToPage(0);
                  });
                },
              ),
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(right: 28.0),
                icon: Icon(Icons.search),
                color: (widget.choosedind == 1) ? Colors.green : null,
                onPressed: () {
                  setState(() {
                    widget.appBarTitle = "Forum";
                    widget.choosedind = 1;
                    _myPage.jumpToPage(1);
                  });
                },
              ),
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(left: 28.0),
                icon: Icon(Icons.notifications),
                color: (widget.choosedind == 2) ? Colors.green : null,
                onPressed: () {
                  setState(() {
                    widget.appBarTitle = "Sahəm";
                    widget.choosedind = 2;
                    _myPage.jumpToPage(2);
                  });
                },
              ),
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(right: 28.0),
                icon: Icon(Icons.account_circle),
                color: (widget.choosedind == 3) ? Colors.green : null,
                onPressed: () {
                  bloc.sigInGoogle();
                  setState(() {
                    widget.appBarTitle = "Profil";
                    widget.choosedind = 3;
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
          Container(
            width: double.infinity,
            height: double.infinity,
            child:Home(null),
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
          StreamBuilder(
            stream: bloc.googleAccount,
            builder: (BuildContext context,
                AsyncSnapshot<GoogleSignInAccount> snapshot) {
              return Center(
                child:
                    (snapshot.hasData) ? Text(snapshot.data.displayName) : null,
              );
            },
          )
        ],
        physics:
            NeverScrollableScrollPhysics(), // Comment this if you need to use Swipe.
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

  String _loggout(LoginBloc bloc) {
    bloc.signOutGoogle();
    return "outed";
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
