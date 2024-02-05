import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskmanager/services/Service_provider.dart';



class CardTodoListWidget extends ConsumerWidget {
  const CardTodoListWidget({super.key,
  required this.getIndex,
  
  });

  final int getIndex;

  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   final taskData = ref.watch(fetchStreamProvider);
      return taskData.when(
        data: (taskData) {

      Color categoryColor = Colors.white;
      final getCategory = taskData[getIndex].category;
      switch (getCategory) {
        case "Learning":
          categoryColor = Colors.yellow;
        break;
        case "Working" :
        categoryColor = Colors.blue;
        break;
        case "General" :
        categoryColor = Colors.green;
        break;




      }
          return SingleChildScrollView(
          child: Container  (
          margin: const EdgeInsets.symmetric(vertical: 4),
          width: double.infinity,
          height: 140,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                decoration:  BoxDecoration(
                  color: categoryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  )
                ),
                width: 20,
              ),
              Expanded(child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: IconButton(icon: Icon(CupertinoIcons.delete),onPressed:()=> ref.read(serviceProvider).deleteTask(taskData[getIndex].docID),),
                    title: Text(taskData[getIndex].title, maxLines: 1,style: TextStyle(decoration: taskData[getIndex].isDone ? TextDecoration.lineThrough : null,fontWeight: FontWeight.bold,fontSize: 20)),
                    subtitle: Text(taskData[getIndex].description,maxLines: 1,style:TextStyle(decoration: taskData[getIndex].isDone ? TextDecoration.lineThrough : null,fontSize: 15)),
                    trailing: Transform.scale(
                      scale: 1.5,
                      child: Checkbox(
                        activeColor: Colors.blue,
                        shape: CircleBorder(),
                        value: taskData[getIndex].isDone,
                        onChanged: (value)=> ref.read(serviceProvider).updateTask(taskData[getIndex].docID, value))),
                    
                    ),
                   Transform.translate(
                    offset: const Offset(0,-12),
                     child: Container(
                      child: Column(children: [
                         Divider(thickness: 0.9,
                      color: Colors.black),
                      Row(mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(taskData[getIndex].dateTask),
                          SizedBox(width: 12,), 
                          Text(taskData[getIndex].timeTask),
                         
                         
                        ],
                      )
                      ]),
                     ),
                   ),
                    
                  ],
                ),
              ))
            ],
          ),
              ),
        );
        },
        error: (error, stackTrace) =>Center(child: Text(stackTrace.toString()),),
        loading: ()=> Center(child: CircularProgressIndicator(),));
    }
    
}
   