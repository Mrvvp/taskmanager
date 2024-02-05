
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskmanager/services/Service_provider.dart';
import 'package:taskmanager/view/addnewtaskmodel.dart';
import 'package:taskmanager/view/cardwidget.dart';

class HomePage extends  ConsumerWidget {
  const HomePage({super.key});


  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskData = ref.watch(fetchStreamProvider);
    return Scaffold(
      backgroundColor: Color(0xff1A1A1A),
      appBar: AppBar(
        backgroundColor: Color(0xff1E6F9F),
        foregroundColor: Color(0xffFFFFFF),
        elevation: 5,
        title:  ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage("lib/images/pexels-andrea-piacquadio-3777946.jpg") ,
            radius: 20,
            
          ),
          
         
        ),
        actions: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.calendar_month),
                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.notifications_outlined),
                ),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.only(top: 20,left: 20,right: 20),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Today's Task",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 20,fontWeight: FontWeight.bold),),
                      Text("Tuesday , 29 Jan",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 12),),
                    ],
                  ),
                 ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xff1E6F9F),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  onPressed: () => showModalBottomSheet(
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    context : context,
                    builder: (context) => AddNewTask(),
                  ), child: Text("+ New Task",style: TextStyle(color: Colors.white,fontSize: 15),)
                  ), 
                  
                  
                ],
              ),
              SizedBox(height: 20,),
              ListView.builder(
                itemCount: taskData.value?.length ?? 0,
                shrinkWrap: true,
                itemBuilder: (context, index)=> CardTodoListWidget(getIndex: index)),
            ],
          ),
        ),
      ),

   );
  }
}