import 'package:courier_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryType extends StatefulWidget{
  const DeliveryType({super.key});

  @override
  State<DeliveryType> createState() => _DeliveryTypeState();
}

class _DeliveryTypeState extends State<DeliveryType> {
  List<String> deliveryType = ['Regular','Cargo','Express'];
  int selectediconindex = 0;
  @override
  Widget build(BuildContext context) {
    final mq= MediaQuery.of(context).size;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
    //  Text("Delivery Type",style:GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 20)),
    //  const SizedBox(height:9),
     Container(
      height:mq.height*0.17,
      width:mq.width,
       child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount:deliveryType.length,
        itemBuilder: (context,index){
          return Stack(
            children: [
              GestureDetector(
                onTap: (){
                    setState(() {
                      selectediconindex =index;
                    });
                },
                child: Container(
                  width:mq.width*0.36,
                   padding:const EdgeInsets.only(top:15,left:16,right:16),
                     margin:const EdgeInsets.only(right:16),
              
                  decoration:BoxDecoration(
                    color:selectediconindex==index? Color(0xFFE6F0EF):Colors.white,
                    border:Border.all(color:selectediconindex==index?Palette.primarycolor:Color(0xFFC8C7CC)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.local_shipping,color:selectediconindex==index?Palette.primarycolor:Color(0xFFC8C7CC))),
                      const SizedBox(height:10),
                    Text(deliveryType[index],style:GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 16)),
                    _buildDeliveryType(index),
                  ],
                  )
                ),
              ),
              selectediconindex==index?Positioned(
                top: 6,
                right:22,

                child: Icon(Icons.check_circle,color:Color.fromARGB(255, 41, 77, 42),size:22)
              ):SizedBox.shrink()
            ],
          );
        },
       ),
     )

    ],);
  }
  
  _buildDeliveryType(int index) {
    switch(index){
      case 0 : return  Text('\$10',style:GoogleFonts.poppins(color:Colors.black54));
      case 1 : return   Text('\$12',style:GoogleFonts.poppins(color:Colors.black54));
      case 2: return     Text('\$15',style:GoogleFonts.poppins(color:Colors.black54));



    }
  }
}