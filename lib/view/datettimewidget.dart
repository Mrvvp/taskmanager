import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class DateTimeWidget extends ConsumerWidget {
  const DateTimeWidget({super.key,
    required this.titleText,
    required this.valueText,
    required this.iconSection,
    required this.onTap,
    
  });

  final String titleText;
  final String valueText;
  final IconData iconSection;
  final VoidCallback onTap;
@override
  Widget build (BuildContext context, WidgetRef ref) {
    return  Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(titleText,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Color(0xffFFFFFF) ,),
          ),
          SizedBox(height: 6,),
          Material(color: Color(0xff1A1A1A),
            child: Ink(
              decoration: BoxDecoration(
                color: Color(0xFF262626),
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                onTap: () => onTap(),
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(iconSection,color: Color(0xffFFFFFF),),
                      SizedBox(width: 6,),
                      Text(valueText,style:TextStyle(color: Color(0xffFFFFFF) ),),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}