import 'package:agrorammers/data/user.dart';

class PlantData {
  final int id;
  final String title;
  final String imageUrl;
  final List<TaskCare> tasks;
  final String note;
  final String description;
  final List<User> members;
  PlantData({
    this.id,
    this.title,
    this.imageUrl,
    this.tasks,
    this.members,
    this.note,
    this.description,
  });
}

class TaskCare {
  int isDone; //0 means it is not done yet, 1 means it is.
  final String note;
  final String timeData;

  TaskCare({this.isDone = 0, this.note, this.timeData});
}
