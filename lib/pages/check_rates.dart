import 'package:courier_app/main.dart';
import 'package:courier_app/utils/colors.dart';
import 'package:courier_app/widgets/delivery_type.dart';
import 'package:courier_app/widgets/parcel_weight.dart';
import 'package:flutter/material.dart';

import '../widgets/parcel_dimensions.dart';
import '../widgets/parcel_type.dart';

class CheckRatePage extends StatefulWidget{
  const CheckRatePage({super.key});

  @override
  State<CheckRatePage> createState() => _CheckRatePageState();
}

class _CheckRatePageState extends State<CheckRatePage> {
  @override
  Widget build(BuildContext context) {

    final mq = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0xFFF5F4F7),

       appBar:
        AppBar(
        backgroundColor: const Color(0xFFF9F9F9),

        elevation: 0,
        leading:IconButton(
          icon:const Icon(Icons.arrow_back_ios_new,
          color:Colors.black
          ),
          onPressed:(){
            Navigator.push(context,MaterialPageRoute(builder: (context) => RootScreen(user: 'User',),));
          }
        ),
        // titleSpacing: 0,
        title:const Text("Check Rates",style:TextStyle(color:Colors.black))
       ),

       body:SingleChildScrollView(
         child: Padding(
           padding: const EdgeInsets.all(12.0),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const  SizedBox(height:10),
            //delivery type
            const PackageFormText(
              text: "Delivery Type", 
              textSize: 16.0),
              const SizedBox(height:4),
             DeliveryType(),
            const SizedBox(height:24),
       
            const LocationFormWidget(
              labelText: "Pickup Point",
              hintText: "Pickup Location",
            ),
            const SizedBox(height:12),
            const LocationFormWidget(
              labelText: "Drop Off Point",
              hintText: "Package Destination",
            ),
       
            const SizedBox(height:24),
            // About Parcel
              const Text("About Package",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
              const Text("Please enter the details below",style: TextStyle(color:Colors.black54)),
       
              const SizedBox(height:12),
              const PackageFormText(text: "Weight", textSize: 14),
              const SizedBox(height:8),
              ParcelWeight(),
              
              //ParcelDimension
              const SizedBox(height:10),
            
              ParcelDimension(),

       


            SizedBox(height:mq.height*0.1),
            
             GestureDetector(
              onTap:(){
       
              },
              child:Container(
                height:mq.height*0.07,
                width:mq.width,
                decoration:BoxDecoration(
                  color:Palette.primarycolor,
                  borderRadius: BorderRadius.circular(9),
                ),
                child:const Center(child: 
                Text("Check Rates",style:TextStyle(color:Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 17,
                )))
              )
             )
           ],),
         ),
       )
    );
  }
}

class LocationFormWidget extends StatelessWidget {
  const LocationFormWidget({
    super.key,
    required this.labelText,
    required this.hintText,
  });

  final String labelText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(labelText,style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
        const SizedBox(height:4),
        TextFormField(
          decoration:InputDecoration(
            fillColor: Colors.white,
            filled:true,
            hintText: hintText,
            suffixIcon: const Icon(Icons.place,color:Palette.primarycolor),
            contentPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide:BorderSide.none,
              borderRadius: BorderRadius.circular(6),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(6),
            )
        
          )
        )
      ],
    );
  }
}