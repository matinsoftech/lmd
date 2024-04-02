import 'package:courier_app/utils/colors.dart';
import 'package:courier_app/widgets/coupon_code.dart';
import 'package:courier_app/widgets/parcel_dimensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../widgets/delivery_type.dart';
import '../widgets/parcel_type.dart';
import '../widgets/parcel_weight.dart';
import 'create_order_nextpage.dart';


class CreateOrderPage extends StatefulWidget{
  const CreateOrderPage({super.key});

  @override
  State<CreateOrderPage> createState() => _CreateOrderPageState();
}

class _CreateOrderPageState extends State<CreateOrderPage> {
    Color containeronecolor = const Color.fromARGB(31, 190, 186, 186);
    Color containertwocolor = Colors.white12;
    Color icon1color = Palette.primarycolor;
    Color icon2color = Colors.black;
    bool containerone = true;
    bool containertwo = false;
    bool pickupformvisibility = true;
    bool deliveryformvisibility = true;
    bool parcel_fragile = true;


  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>CreateOrderSecondPage()));

      },
      label:const Text("Next",style:TextStyle(fontWeight: FontWeight.bold)),
      icon:const Icon(Icons.arrow_forward),
      ),
      
      // bottomSheet: Container(
      //   height:mq.height*0.09,
      //   // color:Colors.white,
      //       child:GestureDetector(
      //         onTap:(){
      //             Navigator.push(context,MaterialPageRoute(builder: (context)=>CreateOrderSecondPage()));
      //         },
      //         child:Center(
      //           child: Container(
      //             width:mq.width,
      //             height:mq.height*0.07,
      //             margin:const EdgeInsets.only(right:10,left:10),
      //             padding:const EdgeInsets.all(12),
      //             decoration: BoxDecoration(color:Palette.primarycolor,
      //             borderRadius: BorderRadius.circular(4),
      //             ),
      //             child:const Center(child: Text("Create Order",style:TextStyle(color:Colors.white,fontSize: 18)))
      //           ),
      //         )
      //       )

      // ),
      appBar:AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // titleSpacing: 0,
        automaticallyImplyLeading: false,
        title:const Text("New Order",style:TextStyle(color: Colors.black,fontWeight:FontWeight.bold))
      ),
      body:SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.only(left:20.0,bottom:20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Row(children: [
              GestureDetector(
                onTap:(){
                  setState(() {
                    containeronecolor = const Color.fromARGB(31, 190, 186, 186);
                    containertwocolor = Colors.white12;
                    icon1color = Palette.primarycolor;
                    icon2color=Colors.black;
                    containerone = true;
                  });
                },
                child: Container(
                  padding:const EdgeInsets.only(left:12,top:12,bottom:12,right:40),
                  margin:const EdgeInsets.only(top:20,bottom:12,right:12),
                  decoration:BoxDecoration(
                    color:containeronecolor,
                    border:Border.all(color:const Color.fromARGB(31, 192, 190, 190)),
                    borderRadius: BorderRadius.circular(12),
                    
                  ),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                     Icon(Icons.schedule,color:icon1color),
                     const SizedBox(height:4),
                     const Text("Deliver Now",style:TextStyle(fontSize: 16,fontWeight: FontWeight.w400)),
              
                  ],)
                ),
              ),
                        GestureDetector(
                onTap:(){
                  setState(() {
                  containeronecolor = Colors.white12;
                  containertwocolor = const Color.fromARGB(31, 190, 186, 186);
                  icon1color = Colors.black;
                  icon2color = Palette.primarycolor;
                  containerone = false;
              
              
                  });
                },
                child: Container(
                  padding:const EdgeInsets.only(left:12,top:12,bottom:12,right:55),
                  margin:const EdgeInsets.only(top:20,bottom:12,right:12),
                  decoration:BoxDecoration(
                   color:containertwocolor,
                    border:Border.all(color:const Color.fromARGB(31, 192, 190, 190)),
                    borderRadius: BorderRadius.circular(12),
                    
                  ),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                     Icon(Icons.calendar_month,color:icon2color),
                     const SizedBox(height:4),
                     const Text("Schedule",style:TextStyle(fontSize: 16,fontWeight: FontWeight.w400)),
              
                  ],)
                ),
              )
              
            ],),
            //Text
            containerone == true? const Text("We will assign the nearest courier to pick-up and deliver as soon as possible.",style:TextStyle(color:Colors.black54)):
            const Text("We will arrive at each address at specified times.",style:TextStyle(color:Colors.black54)),
              
            //Pickup point
            const SizedBox(height:16),
            GestureDetector(
              child: Row(
                 children:  [
                  Container(
                    height:20,
                    width:20,
                    decoration:const BoxDecoration(
                      shape:BoxShape.circle,
                      color:Colors.black
                    ),
                    child:const Center(child: Text("1",style:TextStyle(color:Colors.white)))
                  ),
                  const SizedBox(width:8),
            
                 const Text("Pickup point",style:TextStyle(fontWeight: FontWeight.w500,fontSize: 20)),
                ],
              ),
              onTap:(){
                setState(() {
                  pickupformvisibility = !pickupformvisibility;
                });
              }
        
            ),
            showPickupform(context),
        
          //show delivery point
          const SizedBox(height:30),
            GestureDetector(
              child: Row(
                 children:  [
                  Container(
                    height:20,
                    width:20,
                    decoration:const BoxDecoration(
                      shape:BoxShape.circle,
                      color:Colors.black
                    ),
                    child:const Center(child: Text("2",style:TextStyle(color:Colors.white)))
                  ),
                  const SizedBox(width:8),
            
                 const Text("Delivery point",style:TextStyle(fontWeight: FontWeight.w500,fontSize: 20)),
                ],
              ),
              onTap:(){
                setState(() {
                  deliveryformvisibility = !deliveryformvisibility;
                });
              }
        
            ),
            showdeliveryform(context),
        
            // Padding(
            //   padding: const EdgeInsets.only(top:20.0,bottom:12.0,right:4),
            //   child: Container(
            //     width:mq.width,
            //     height:mq.height*0.01,
            //     color:const Color.fromARGB(31, 128, 120, 120),
            //   ),
            // ), 
                       
            const SizedBox(height:20),
            const Text("About Package",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
            const Text("Please enter the details below",style: TextStyle(color:Colors.black54)),

            const SizedBox(height:12),

            ParcelType(),
            const SizedBox(height:10),

            Padding(
              padding: const EdgeInsets.only(right:8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              const PackageFormText(text: "Weight", textSize: 14),
              ParcelWeight(),
              
              //ParcelDimension
              const SizedBox(height:10),
            
              ParcelDimension(),
            
                ],
              ),
            ),
            const SizedBox(height:30),
            //Fragile or not
            const Text("Option",style:TextStyle(fontWeight:FontWeight.bold,fontSize: 18)),
            const SizedBox(height:2),
            Padding(
              padding: const EdgeInsets.only(right:20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  const Text("Fragile",style:TextStyle(fontSize:18)),
                  Switch(
                    splashRadius: 40.0,
                    value : parcel_fragile,
                    activeColor: Palette.primarycolor,
                    onChanged: (bool value){
                    setState(() {
                      parcel_fragile = value;
                    });
                  },
                  
                  )
            
                ],
              ),
            ),
            const Divider(),
            //fragile
            const SizedBox(height:6),
            const PackageFormText(
              textSize: 20.0,
              text: "Delivery Type",
            ),
            const SizedBox(height:9),

            const DeliveryType(),
            const SizedBox(height:20),
            const CouponCode(),

            const SizedBox(height:20),
          ],),
        ),
      )
    );
 }


 Widget showPickupform(BuildContext context) {
  return Visibility(
    visible: pickupformvisibility,
    child: Container(
            margin:const EdgeInsets.only(left:8,top:8),
            padding:const EdgeInsets.only(left:28,right:6),
            decoration:const BoxDecoration(
             border:Border(left: BorderSide(color:Colors.black,width:4))
            ),
      child:Column(
        children: [
          
          TextFormField(
            decoration:const InputDecoration(
            labelText: "Address",
            labelStyle: TextStyle(color:Colors.black45,fontSize: 17),
              suffixIcon: Icon(Icons.place_outlined)
            )
  
          ),
          
          TextFormField(
            decoration:const InputDecoration(
            labelText: "Phone number",
            labelStyle: TextStyle(color:Colors.black45,fontSize: 17),
              suffixIcon: Icon(Icons.call)
            )
  
          ),
  
          containerone == false?
  
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height:8),
                const Text("When to arrive at this address",style:TextStyle(color:Colors.black45,fontSize: 14)),
                TextFormField(
                decoration:const InputDecoration(
                suffixIcon: Icon(Icons.access_time,size:26),
                contentPadding: EdgeInsets.symmetric(vertical: 0.0)
                )
          ),
            ],
            ):const SizedBox.shrink()
  
  
        ],
      ),
    ),
  );
 }



  Widget showdeliveryform(BuildContext context) {
    final mq = MediaQuery.of(context).size;
  return Visibility(
    visible: deliveryformvisibility,
    child: Container(
            margin:const EdgeInsets.only(left:8,top:8,),
            padding:const EdgeInsets.only(left:28,right:6),
            decoration:const BoxDecoration(
             border:Border(left: BorderSide(color:Colors.black,width:4))
            ),
      child:Column(
        children: [
          
          TextFormField(
            decoration:const InputDecoration(
            labelText: "Address",
            labelStyle: TextStyle(color:Colors.black45,fontSize: 17),
              suffixIcon: Icon(Icons.place_outlined)
            )
  
          ),
          TextFormField(
            decoration:const InputDecoration(
            labelText: "Phone number",
            labelStyle: TextStyle(color:Colors.black45,fontSize: 17),
              suffixIcon: Icon(Icons.call)
            )
  
          ),
  
          containerone == false?
  
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height:8),
                const Text("When to arrive at this address",style:TextStyle(color:Colors.black45,fontSize: 14)),
                SizedBox(
                  height:mq.height*0.05,
                  child: TextFormField(
                  
                  decoration:const InputDecoration(
                   
                  suffixIcon: Icon(Icons.access_time,size:26),
                  contentPadding: EdgeInsets.symmetric(vertical: 0.0,horizontal:1)
                  )
                          ),
                ),
            ],
            ):const SizedBox.shrink()
  
  
        ],
      ),
    ),
  );
 }

}

