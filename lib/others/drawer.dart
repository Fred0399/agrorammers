import 'package:agrorammers/screens/catalog_page.dart';
import 'package:flutter/material.dart';

class AppIconForDrawer extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey;

  AppIconForDrawer(this._scaffoldKey);

  @override
  Widget build(BuildContext context) {
    return Container(
      // key:_scaffoldKey,
      child: IconButton(
        iconSize: 32,
        alignment: Alignment.bottomLeft,
        icon: ImageIcon(
          AssetImage("assets/images/menu_button.png"),
          color: Color(0xFFFFFFFF),
        ),
        onPressed: () {
          _scaffoldKey.currentState.openDrawer();
        },
      ),
    );
  }
}

class DrawerPg extends StatelessWidget {
  final Function comenSoonen;
  final Function logout;

  DrawerPg({this.comenSoonen, this.logout});

  static Widget instaFaceRow(BuildContext ctx, Color iconColor, bool isDraw) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: ImageIcon(
            AssetImage("assets/images/instagram.png"),
            color: iconColor,
          ),
          iconSize: 33,
          onPressed: () {
            if (isDraw) Navigator.of(ctx).pop();
          },
        ),
        IconButton(
          icon: ImageIcon(
            AssetImage("assets/images/facebook.png"),
            color: iconColor,
          ),
          iconSize: 33,
          onPressed: () {
            if (isDraw) Navigator.of(ctx).pop();
          },
        ),
      ],
    );
  }

  Widget drawDesign({String content, Function pressFunc}) {
    return FlatButton(
      onPressed: pressFunc,
      child: Text(
        content,
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            drawDesign(
                content: "Sahəm",
                pressFunc: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacementNamed("/");
                }),
            drawDesign(
              content: "Kataloq",
              pressFunc: () {
                // Navigator.of(context).pop();
                Navigator.of(context).pushNamed(CatalogPage.routeName);
              },
            ),
            drawDesign(
              content: "Çıxış",
              pressFunc: () => logout,
            ),
          ],
        ),
      ),
    );
  }
}
