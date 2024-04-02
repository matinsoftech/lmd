import 'package:courier_app/pages/order_tracking_map.dart';
import 'package:courier_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../components/parcel_timeline.dart';
import '../main.dart';

class TrackParcel extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Colors.white,
        elevation:0,
        leading:IconButton(icon: const Icon(Icons.arrow_back_ios,color:Colors.white),
        onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (context) => RootScreen(user: '',),));
          // Navigator.pop(context);
        },
        )
      ),
      body:Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
            const Text("Tracking",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 24)),
            const SizedBox(height:18),
            Container(
              padding:const EdgeInsets.all(14),
              decoration:BoxDecoration(
                color:Colors.white,
                // border:Border.all(color:Colors.grey),
                borderRadius: BorderRadius.circular(9),
                boxShadow: const[
                  BoxShadow(
                    color:Color.fromRGBO(218, 218, 218, 0.45),
                    blurRadius: 2,
                    spreadRadius: 0,
                    offset:Offset(1, 1)
        
                  ),
                BoxShadow(
                  color:Color.fromRGBO(218, 218, 218, 0.45),
                    blurRadius: 2,
                    spreadRadius: 0,
                    offset:Offset(-1,-1)
        
                  )
        
                ]
              ),
              child:Column(children:  [
                Row(
                  children: [
                     const CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 245, 220, 228),
                        radius: 20,
                      child: Icon(Icons.card_giftcard,color:Colors.orange),),
                      const SizedBox(width:12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const[
                        Text("Blue Flying Shoes",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                        SizedBox(height:5),
                        Text("Tracking ID:956367836",style:TextStyle(color:Colors.black54,fontWeight: FontWeight.w500)),
        
                      ],
                    ),                
                  ],
                ),

                Container(
                  width:mq.width,
                  padding:const EdgeInsets.all(4),
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color:const Color(0xFFEEFCEF)
                  ),
                  margin:EdgeInsets.only(top:10),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const[
                      Icon(CupertinoIcons.clock_fill,color:Color(0xFF59DD6F),size:18),
                      SizedBox(width:4),
                      Text("In delivery",style:TextStyle(color:Color(0xFF59DD6F),fontWeight: FontWeight.bold)),
                    ],
                  )
                ),
                const ParcelTimelineTile(
                  isFirst: true,isLast: false,isPast:true,
                  txt1:"Request Accepted",
                  txt2:"7:00 AM .Feb 7,2023",
                  
                  ),
                const ParcelTimelineTile(
                  isFirst: false,isLast: false,isPast:true,
                  txt1:"Parcel Picked",
                  txt2:"9:00 AM .Feb 7,2023",
        
                  ),
                const ParcelTimelineTile(
                  isFirst: false,isLast: false,isPast:false,
                  txt1:"Drop Point",
                  txt2:"3:00 PM .Feb 7,2023",
        
                  ),
                const ParcelTimelineTile(
                  isFirst: false,isLast: true,isPast:false,
                  txt1:"Delivered at Address",
                  txt2:"5:00 PM .Feb 7,2023",
        
                  )
        
              
              
              ],)
            ),
            const SizedBox(height:14),
                  GestureDetector(
                    onTap:(){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>OrderTrackingMap()));
                      
                    },
                    child:Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border:Border.all(color: Palette.primarycolor),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Center(child:Text("Live Tracking",style:TextStyle(color:Palette.primarycolor,fontSize: 20,fontWeight: FontWeight.w500)))
                    )
                )
        
          ],),
        ),
      )
    );
  }

}