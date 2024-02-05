import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taskmanager/model/task_model.dart';


class TaskService {
  final taskCollection = FirebaseFirestore.instance.collection("Taskmanager");
  
  
  
  void addNewTask (TaskManagerModel model){
    taskCollection.add(model.toMap());
  }

  void updateTask (String? docID ,bool? valueUpdate){
    taskCollection.doc(docID).update({
      "isDone" : valueUpdate,
    });
  }

  void deleteTask(String? docID){
    taskCollection.doc(docID).delete();
  }
}