
import 'dart:developer';

import 'package:courier_app/pages/orderFilteration/pickedupresultpage.dart';
import 'package:courier_app/utils/colors.dart';
import 'package:flutter/material.dart';

import 'filtereddeliveredorderResult.dart';

class PickupOrderFilterationPage extends StatefulWidget {
  final String? frompage;
  const PickupOrderFilterationPage({super.key,required this.frompage});

  @override
  State<PickupOrderFilterationPage> createState() => _PickupOrderFilterationPageState();
}

class _PickupOrderFilterationPageState extends State<PickupOrderFilterationPage> {
  
  DateTime? userSelectedFromDate;
  String? finaluserSelectedFromDate;
  DateTime? userSelectedToDate;
  String? finaluserSelectedToDate;

  DateTime currentDate=DateTime.now();
  String? initialDate;
  List<String> dayslist = ["Today","Yesterday","This week"];

  String? startDate;
  String? endDate;
  String? stringyesterdayDate;
  String? stringLastMonday;

@override
void initState() {
  super.initState();
  initialDate =  "${currentDate.year}-${currentDate.month}-${currentDate.day}";
  
  DateTime yesterdayDate = currentDate.subtract(Duration(days:1));
  stringyesterdayDate =   "${yesterdayDate.year}-${yesterdayDate.month}-${yesterdayDate.day}";

  DateTime lastMonday = currentDate.subtract(Duration(days:currentDate.weekday-1));
  while(lastMonday.weekday!=DateTime.monday){
    lastMonday = lastMonday.subtract(Duration(days:1));
  }
  stringLastMonday = "${lastMonday.year}-${lastMonday.month}-${lastMonday.day}";

  log(stringyesterdayDate!);
  log(stringLastMonday!);

} 
  fromdatePicker(context)async{
      userSelectedFromDate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate:DateTime(2000), lastDate: DateTime(2050));
      if(userSelectedFromDate==null){

        return;
      }else{
        setState(() {
        finaluserSelectedFromDate = "${userSelectedFromDate!.year}-${userSelectedFromDate!.month}-${userSelectedFromDate!.day}";

        });
      }
  
  }

    todatePicker(context)async{
      userSelectedToDate = await showDatePicker(context: context, initialDate: userSelectedFromDate??DateTime.now(), firstDate:userSelectedFromDate??DateTime.now(), lastDate: DateTime(2050));
      if(userSelectedToDate==null){

        return;
      }else{
        setState(() {
        finaluserSelectedToDate = "${userSelectedToDate!.year}-${userSelectedToDate!.month}-${userSelectedToDate!.day}";

        });
      }
  
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 0,
        titleSpacing: 40,
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Palette.primarycolor,),
        title: Text(widget.frompage=="pickedup"?"Pick Up Order":"Delivered Order",style:TextStyle(color:Colors.black,fontSize: 18)),

      ),
      body:Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const SizedBox(height:20),
          const Text("Select a specific date to view\nPick Up Orders.",style: TextStyle(fontSize: 17),),
          SizedBox(height:20),
          Card(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12,20,12,20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width:MediaQuery.of(context).size.width,
                    height:40,
                    child: ListView.builder(
                      
                      scrollDirection: Axis.horizontal,
                      itemCount: dayslist.length,
                      itemBuilder: (context, index) {
                        final day = dayslist[index];
                      return  GestureDetector(
                      onTap:(){
                      setState(() {
                         if (index == 0) {          
                             startDate = initialDate;
                              endDate = initialDate;
                           } else if (index == 1) {
                               startDate = stringyesterdayDate;
                               endDate = stringyesterdayDate;
                            } else if (index == 2) {
                              startDate = stringLastMonday;
                              endDate = initialDate;
                           }
                          });
                        if(widget.frompage=="pickedup"){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>FilterOrderResultPagePicked(
                          fromDate:startDate,
                          toDate:endDate

                         )));

                         }else if(widget.frompage=="delivered"){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>FilterOrderDeliveredResultPage(
                          fromDate:startDate,
                          toDate:endDate

                        )));

              }
                      },
                      child:Container(
                        margin:const EdgeInsets.only(right:8),
                        padding:const EdgeInsets.fromLTRB(10,8,10,8),
                        decoration: BoxDecoration(
                          color:const Color(0xFFF0EFF5),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child:Text(day,style:const TextStyle(fontSize: 16))
                      )
                    );
                  
                    },),
                  ),
                  const SizedBox(height:20),
                  Row(
                    children: [
                      const Text("From :",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap:(){
                            fromdatePicker(context);
                        },
                        child:Container(
                          padding: const EdgeInsets.fromLTRB(20,15,20,15),
                          decoration: BoxDecoration(color:Palette.primarycolor,
                          borderRadius: BorderRadius.circular(40),
                          
                          ),
                          child:Text(userSelectedFromDate!=null?finaluserSelectedFromDate?? '':initialDate!,style:const TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 16))
                        )
                      )
                      
                    ],
                  ),
            
              const SizedBox(height:20),
               Row(
              children: [
                const Text("To :",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                const SizedBox(width: 50),
                GestureDetector(
                  onTap:(){
                      todatePicker(context);
                  },
                  child:Container(
                    padding: const EdgeInsets.fromLTRB(20,15,20,15),
                    decoration: BoxDecoration(color:Palette.primarycolor,
                    borderRadius: BorderRadius.circular(40),
                    
                    ),
                    child:Text(userSelectedToDate!=null?finaluserSelectedToDate?? '':finaluserSelectedFromDate??initialDate!,style:const TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 16))
                  )
                )
            
              ],
            ),
            const SizedBox(height: 30,),

            GestureDetector(onTap:(){
            if(userSelectedFromDate==null){
              finaluserSelectedFromDate=initialDate;
            }
            if(userSelectedToDate==null){
                finaluserSelectedToDate = finaluserSelectedFromDate;
            }
              log(finaluserSelectedFromDate!);
              log(finaluserSelectedToDate!);
              if(widget.frompage=="pickedup"){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>FilterOrderResultPagePicked(
                fromDate:finaluserSelectedFromDate,
                toDate:finaluserSelectedToDate

              )));

              }else if(widget.frompage=="delivered"){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>FilterOrderDeliveredResultPage(
                fromDate:finaluserSelectedFromDate,
                toDate:finaluserSelectedToDate

              )));

              }
            },
            child:Container(
              padding: const EdgeInsets.only(top:10,bottom:10),
              width:MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color:Palette.primarycolor,borderRadius: BorderRadius.circular(6)),
              child:const Center(child: Text("Apply Filter",style:TextStyle(color:Colors.white,fontSize: 18,fontWeight: FontWeight.bold,letterSpacing: 1)))
            )
            )
            
            
                ],
              ),
            ),
          ),

        ],),
      )
    );
  }
}