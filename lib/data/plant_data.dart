
import 'package:flutter/material.dart';

class PlantData{
  final int id;
  final String title;
  final Image image;
  final List<TaskCare> tasks;
  PlantData({this.id,this.title,this.image,this.tasks});
}

class TaskCare{
  final int isDone;//0 means it is not done yet, 1 means it is.
  final String note;
  final String timeData;

  TaskCare({this.isDone=0,this.note,this.timeData});

}