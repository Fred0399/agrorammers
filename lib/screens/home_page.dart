import 'package:agrorammers/blocs/user_plants.dart';
import 'package:agrorammers/data/plant_data.dart';
import 'package:agrorammers/data/user.dart';
import 'package:agrorammers/screens/market-page.dart';
import 'package:agrorammers/screens/pop_up.dart';
import 'package:agrorammers/screens/user_profile.dart';
import 'package:agrorammers/widgets/my_plant.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../blocs/login_provider.dart';
import '../others/drawer.dart';
import 'forum_home.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  int choosedind = 0;
  String appBarTitle = "Sahəm";
  User loggedUser;

  List<PlantData> list;

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
                  if (widget.loggedUser != null) {
                    UserPlants()
                        .getPlants(widget.loggedUser.socialId)
                        .then((result) {
                      setState(() {
                        widget.choosedind = 0;
                        widget.appBarTitle = "Sahəm";
                        _myPage.jumpToPage(0);
                        widget.list = result;
                      });
                    }).catchError((error) {
                      print(error);
                    });
                  }
                },
              ),
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(right: 28.0),
                icon: Icon(Icons.forum),
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
                icon: Icon(Icons.store),
                color: (widget.choosedind == 2) ? Colors.green : null,
                onPressed: () {
                  setState(() {
                    widget.appBarTitle = "Bazar";
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
                    widget.appBarTitle = "Hesab";
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
          // print('Page Changes to index $int');
        },
        children: <Widget>[
          (widget.list != null && widget.list.length > 0)
              ? Container(
                  width: double.infinity,
                  height: double.infinity,
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 5),
                  child: Home(widget.list),
                )
              : Center(
                  child: Container(
                    child: Text("Bitki əlavə edilməyib!"),
                  ),
                ),
          (widget.loggedUser != null)
              ? ForumHome(widget.loggedUser)
              : Center(
                  child: Container(
                    child: Text('Forumlara baxmaq üçün hesaba daxil olun!'),
                  ),
                ),
          Center(
            child: MarketPage(),
          ),
          (widget.loggedUser == null)
              ? StreamBuilder(
                  stream: bloc.userAccount,
                  builder: (BuildContext context,
                      AsyncSnapshot<Map<String, dynamic>> snapshot) {
                    if (snapshot.hasData &&
                        snapshot.data != null &&
                        snapshot.data['status'] == "success" &&
                        snapshot.data['data'] != null) {
                      widget.loggedUser = new User(
                          id: snapshot.data['data']['id'],
                          name: snapshot.data['data']['name'],
                          email: snapshot.data['data']['email'],
                          socialId: snapshot.data['data']['social_id'],
                          imageUrl: snapshot.data['data']['picture_url']);
                    }
                    if (widget.loggedUser == null)
                      return Center(
                        child: Text("Məlumat yoxdur!"),
                      );
                    return UserProfile(userData: widget.loggedUser);
                  },
                )
              : UserProfile(userData: widget.loggedUser),
        ],
        physics:
            NeverScrollableScrollPhysics(), // Comment this if you need to use Swipe.
      ),
      floatingActionButton: Container(
        height: 65.0,
        width: 65.0,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              PopUP().showAlertPlant(context, widget.loggedUser.id);
            },
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
