import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:taskmanager/model/task_model.dart';
import 'package:taskmanager/provider/date_time_provider.dart';
import 'package:taskmanager/provider/radio_provider.dart';
import 'package:taskmanager/services/Service_provider.dart';
import 'package:taskmanager/view/datettimewidget.dart';
import 'package:taskmanager/view/radiowidget.dart';
import 'package:taskmanager/view/textfieldwidget.dart';

class AddNewTask extends ConsumerWidget {
   AddNewTask({super.key});

  final titileController = TextEditingController();
  final descriptionController = TextEditingController();


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateProv = ref.watch(dateProvider);

    return Container(
       padding: const EdgeInsets.all(30),
      height: MediaQuery.of(context).size.height* 0.80,
      decoration:  BoxDecoration(
        color: const Color(0xff1A1A1A),
        borderRadius: BorderRadius.circular(16),
      ),
      child:  Column(crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          SizedBox(
              width: double.infinity,
              child: Text("New Task",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize:22,fontWeight:FontWeight.bold,
              color: Color(0xffFFFFFF)
              ),
              )
              ),
              Divider(thickness: 0.1,),
              SizedBox(height: 12,),
              Text("Title",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Color(0xffFFFFFF)
              )
              ),
              SizedBox(height: 12),
              TextFieldWidget(maxLine :1 ,hintText: "Add title", txtController: titileController,),
              SizedBox(height: 12,),
               Text("Description",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Color(0xffFFFFFF) ),
              ),
               SizedBox(height: 12,),
         TextFieldWidget(maxLine: 5, hintText: "Add description", txtController: descriptionController,),
           SizedBox(height: 12,),
           Text("Category",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Color(0xffFFFFFF) ,),),
             SizedBox(height: 10,),
          Row(
            children:  [
              Expanded(child: RadioWidget(categColor: Colors.yellow,titleRadio: "Learn", valueInput: 1, onChangeValue: () => ref.read(radioProvider.notifier).update((state) => 1),),),
              Expanded(child: RadioWidget(categColor: Colors.blue,titleRadio: "Work", valueInput: 2, onChangeValue:() => ref.read(radioProvider.notifier).update((state) => 2),),),
              Expanded(child: RadioWidget(categColor: Colors.green,titleRadio: "Other", valueInput: 3, onChangeValue:() => ref.read(radioProvider.notifier).update((state) => 3),),),
            ],
          ),
          Row(
            children: [
              DateTimeWidget(titleText: 'Date', valueText: dateProv, iconSection: CupertinoIcons.calendar,
              onTap: () async{
                final getValue = await showDatePicker(context: context, firstDate: DateTime(2024), lastDate: DateTime(2025));
               if(getValue != null){
                final format = DateFormat.yMd();
                ref.read(dateProvider.notifier).update((state) => format.format(getValue));
               }
                
              },
              ),
              SizedBox(width: 22,),
              DateTimeWidget(titleText: 'Time', valueText: ref.watch(timeProvider), iconSection: CupertinoIcons.clock,
              onTap: ()async {
                final getTime = await showTimePicker(context: context, initialTime: TimeOfDay.now());
                if(getTime != null){
                  ref.read(timeProvider.notifier).update((state) => getTime.format(context));
                }
              },),
              
            ],
          ),
          SizedBox(height: 25,),
          Row(
            children: [
              Expanded(child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  side: BorderSide(
                    color: Color(0xffFFFFFF),
                  ),

                ),
                onPressed: () => Navigator.pop(context),
                child: Text("Cancel"),
              ),
              ),
              SizedBox(width: 22,),
               Expanded(child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                 backgroundColor: const Color(0xff1E6F9F),
                  side: const BorderSide(
                    color: Color(0xffFFFFFF),
                  ),
                  
                ),
                onPressed: () {

                  final getRadioValue = ref.read(radioProvider);
                  String category = "";

                  switch(getRadioValue){
                    case 1:
                    category = "Learning";
                    break;
                    case 2:
                    category = "Working";
                    break; 
                    case 3:
                    category = "General";
                    break;

                  }

                  
                  ref.read(serviceProvider).addNewTask(
                    TaskManagerModel(
                      title: titileController.text, 
                      description: descriptionController.text, 
                      category: category, 
                      dateTask: ref.read(dateProvider), 
                      timeTask: ref.read(timeProvider),
                      isDone: false));

                  titileController.clear();
                  descriptionController.clear();
                  ref.read(radioProvider.notifier).update((state) => 0);
                  Navigator.pop(context);
                },
                child: Text("Create",style: TextStyle(color: Colors.white),),
              ),
              ),
            ],
          )
              ]
      ),
    );


  }
}