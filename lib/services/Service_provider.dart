import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskmanager/model/task_model.dart';
import 'package:taskmanager/services/services.dart';

final serviceProvider = StateProvider<TaskService>((ref) {
  return TaskService();
});

final fetchStreamProvider = StreamProvider<List<TaskManagerModel>> ((ref) async* {
  final getData = FirebaseFirestore.instance
      .collection("Taskmanager")
      .snapshots()
      .map((event) => event.docs.map((snapshot) => TaskManagerModel.fromSnapshot(snapshot)).toList());
     yield* getData;

});