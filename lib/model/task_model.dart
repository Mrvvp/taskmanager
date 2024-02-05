import 'package:cloud_firestore/cloud_firestore.dart';

class TaskManagerModel{
   String? docID;
   final String title;
   final String description;
   final String category;
   final String dateTask;
   final String timeTask;
   final bool isDone;
   
   TaskManagerModel({
    this.docID,
   required this.title,
   required this.description,
   required this.category,
   required this.dateTask,
   required this.timeTask,
   required this.isDone,
     

});
   Map<String ,dynamic> toMap(){
      return <String,dynamic>{
         "title" : title,
         "description" : description,
         "category" : category,
         "dateTask" :dateTask,
         "timeTask" : timeTask,
         "isDone" : isDone,
        
      };
   }
   factory TaskManagerModel.fromMap(Map<String ,dynamic>map) {
      return TaskManagerModel(
          docID: map["docID"] != null ? map["docID"] as String : null,
          title: map["title"] as String,
          description: map["description"] as String,
          category: map["category"] as String,
          dateTask: map["dateTask"] as String,
          timeTask: map["timeTask"] as String,
          isDone: map["isDone"] as bool,
          
      );
   }
   
  factory TaskManagerModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>>doc){
      return TaskManagerModel(
         docID : doc.id,
         title: doc["title"],
          description: doc["description"],
          category: doc["category"],
          dateTask: doc["dateTask"],
          timeTask: doc['timeTask'],
          isDone: doc["isDone"],
          
      );
  }
}