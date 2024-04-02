import 'package:courier_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OurServices extends StatefulWidget{
  @override
  State<OurServices> createState() => _OurServicesState();
}

class _OurServicesState extends State<OurServices> {
  @override
  Widget build(BuildContext context) {
    final mq =  MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom:20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
        const Text("Our Services",style:TextStyle(color:Colors.black,fontSize:20,fontWeight: FontWeight.w500)),
        const SizedBox(height:10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding:const EdgeInsets.fromLTRB(50,30,50,30),
              decoration:BoxDecoration(
                color:Palette.fillgreenColor,
                borderRadius:BorderRadius.circular(16)
              ),
              child:Column(children: [
              Icon(Icons.local_shipping_outlined,color:Palette.primarycolor,size:mq.height*0.07),
              const SizedBox(height:10),
              const Text("Courier",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 16))
              ],)
      
            ),
            Container(
              padding:const EdgeInsets.fromLTRB(50,30,50,30),
              decoration:BoxDecoration(
                color:Palette.fillgreenColor,
                borderRadius:BorderRadius.circular(16)
              ),
              child:Column(children: [
              Icon(CupertinoIcons.cube,color:Palette.primarycolor,size:mq.height*0.06),
              const SizedBox(height:12),
              const Text("Tracking",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 16))
              ],)
      
            )
      
        ],)
      
      ],),
    );
  }
}