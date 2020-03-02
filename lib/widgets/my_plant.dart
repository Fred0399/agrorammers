import 'package:agrorammers/data/plant_data.dart';
import 'package:agrorammers/screens/pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyPlant extends StatefulWidget {
  PlantData plantData;
  bool valCheck = false;
  MyPlant({this.plantData});

  @override
  _MyPlantState createState() => _MyPlantState();
}

class _MyPlantState extends State<MyPlant> {
  int get tasksDone {
    int count = 0;
    for (TaskCare item in widget.plantData.tasks) {
      if (item.isDone == 1) count++;
    }
    return count;
  }

  Widget task(BuildContext ctx, Size screenSz, TaskCare task) {
    if (task.isDone == 0) {
      widget.valCheck = false;
    } else if (task.isDone == 1) {
      widget.valCheck = true;
    }
    return Container(
      height: screenSz.height * 0.08,
      width: screenSz.width * 0.85,
      margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          LimitedBox(maxWidth: screenSz.width * 0.60, child: Text(task.note)),
          Checkbox(
            value: widget.valCheck,
            onChanged: (bool val) {
              if (val == true) {
                setState(() {
                  task.isDone = 1;
                });
              } else {
                setState(() {
                  task.isDone = 0;
                });
              }
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width * 0.85,
      height: screenSize.height * 0.40,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 2.5,
        child: Column(children: <Widget>[
          Container(
            // color: Colors.black45,
            width: screenSize.width * 0.85,
            height: screenSize.height * 0.08,
            child: Container(
              width: screenSize.width * 0.55,
              height: screenSize.height * 0.10,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: screenSize.width * 0.23,
                    height: screenSize.height * 0.10,
                    padding: EdgeInsets.all(5),
                    child: Center(
                      child: Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: (widget.plantData.imageUrl != null)
                                ? Image.network(widget.plantData.imageUrl)
                                : null,
                          ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: screenSize.width * 0.25,
                    height: screenSize.height * 0.10,
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.plantData.title,
                          style: TextStyle(fontSize: screenSize.height * 0.025),
                        ),
                        Text(
                          "$tasksDone/${widget.plantData.tasks.length}",
                          style: TextStyle(
                              fontSize: screenSize.height * 0.018,
                              color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: screenSize.height * 0.10,
                    width: screenSize.width * 0.30,
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Image.asset(
                        "assets/ui_icons/add_user.png",
                        fit: BoxFit.cover,
                        color: Theme.of(context).primaryColor,
                      ),
                      iconSize: screenSize.height * 0.020,
                      onPressed: () {
                        PopUP().showAlertCustom(context, widget.plantData.id);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Divider(),
          Container(
            width: screenSize.width * 0.85,
            height: screenSize.height * 0.26,
            child: ListView.builder(
              itemBuilder: (BuildContext ctx, int index) {
                return task(ctx, screenSize, widget.plantData.tasks[index]);
              },
              itemCount:
                  (widget.plantData != null && widget.plantData.tasks != null)
                      ? widget.plantData.tasks.length
                      : 0,
            ),
          )
        ]),
      ),
    );
  }
}
