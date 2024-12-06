import 'package:flutter/material.dart';
import 'package:untitled42/TaskModel.dart';

class TaskProvider with ChangeNotifier {
  List<TaskModel> tasks = [];

  void addTask(String taskss) {
    tasks.add(TaskModel(taskName: taskss,));
    notifyListeners();
  }


  void removeTask(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }
}
