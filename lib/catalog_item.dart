import 'package:agrorammers/screens/catalog_disease_info_page.dart';
import 'package:agrorammers/screens/catalog_diseases_list_page.dart';
import 'package:flutter/material.dart';

class CatalogItem extends StatelessWidget {
  final String title;
  final String imageFolder;
  final String imageType;
  final String pageInd;
  String imagePath;

  CatalogItem({
    @required this.title,
    this.imageFolder = 'catalog_items',
    this.imageType = 'png',
    this.pageInd = '0',
  }) {
    this.imagePath = 'assets/' + imageFolder + '/' + title + '.' + imageType;
  }

  void select(BuildContext ctx) {
    if (pageInd == '0') {
      Navigator.of(ctx).pushNamed(CatalogDiseasesListPage.routeName,
          arguments: {'plantName': title});
    } else {
      Navigator.of(ctx).pushNamed(
        CatalogDiseaseInfoPage.routeName,
        arguments: {
          'diseaseName': title,
          'diseaseParent': imageFolder,
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () => select(context),
        splashColor: Colors.red,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            color: Colors.yellowAccent.withOpacity(0.7),
          ),
          height: MediaQuery.of(context).size.height * 0.2,
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                LimitedBox(
                  maxWidth: MediaQuery.of(context).size.width * 0.4,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LimitedBox(
                      maxWidth: MediaQuery.of(context).size.width * 0.40,
                      child: Image(
                        // height: 110,
                        image: AssetImage(imagePath),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
