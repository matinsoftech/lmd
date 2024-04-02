import 'package:courier_app/pages/order_request_sucesspage.dart';
import 'package:courier_app/utils/colors.dart';
import 'package:courier_app/widgets/parcel_type.dart';
import 'package:courier_app/widgets/parcel_weight.dart';
import 'package:courier_app/widgets/payment_method.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateOrderSecondPage extends StatefulWidget{
  const CreateOrderSecondPage({super.key});

  @override
  State<CreateOrderSecondPage> createState() => _CreateOrderSecondPageState();
}

class _CreateOrderSecondPageState extends State<CreateOrderSecondPage> {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Scaffold(

      bottomSheet: Container(
        height:mq.height*0.09,
        width:mq.width,
        child:Container(
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
              child:GestureDetector(
                onTap:(){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>const OrderRequestPage()));
                },
               child:Padding(
                 padding: const EdgeInsets.fromLTRB(80, 10,80, 10),
                 child: Container(
                  decoration:BoxDecoration(
                    color:Palette.primarycolor,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child:const Center(child: Text("Create order",style:TextStyle(color:Colors.white,fontSize: 18)))
                 ),
               ) 
              )
        )
      ),


      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor:Colors.white,
        leading:IconButton(icon: const Icon(Icons.arrow_back,color:Colors.black,),onPressed:()=>Navigator.pop(context)),
        title:const Text("Submit Order",style:TextStyle(fontWeight: FontWeight.w500,color:Colors.black))
      ),
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const Text("Delivery Address",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
            const Text("Double check your shipping address",style:TextStyle(fontSize:12,color:Colors.black54,)),
            const SizedBox(height:10),
             ContainerWidget(
              contains:[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const[
               CircleAvatar(
                backgroundColor: Color(0xFFF9E5E7),
                child: Icon(CupertinoIcons.placemark_fill,color:Color(0xFFFF2C55))),
             SizedBox(width:8),
             Expanded(
              child: Text("43 Bourke Street, Newbridge NSW 837 Raffles Place, Boat Band M83",
              style:TextStyle(fontWeight: FontWeight.w500,letterSpacing: 0.2,fontSize: 15)
              ),
            ),
          
                ],)
            ]
          
            ),
          
              //2nd Container
          const SizedBox(height:20),
          const Text("Package",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
          const SizedBox(height:5),
          const ContainerWidget(
                    contains: [
                  Text.rich(
                    TextSpan(children:[
                      TextSpan(text:"What's in it: ",style:TextStyle(color:Colors.black54,fontSize: 15)),
                      TextSpan(text:"Documents",style:TextStyle(fontWeight: FontWeight.w500,fontSize: 15))
                    ]
                     
                    )
                  ),
                  SizedBox(height:4),
                  Text("Up to 1 kg, book a courier",
                  style:TextStyle(fontWeight: FontWeight.w500,letterSpacing: 0.2,fontSize: 15)
                  ),
                ],
          ),
          
          
          // Total Amount
          const SizedBox(height:20),
          const Text("Amount",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
          const SizedBox(height:5),
          
          ContainerWidget(
              contains:[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Courier Charge",style:TextStyle(fontSize: 17)),
                    Text("\$20",style:TextStyle(color:Colors.black54,fontSize: 17)),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Delivery",style:TextStyle(fontSize: 17)),
                    Text("\$10",style:TextStyle(color:Colors.black54,fontSize: 17)),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Coupon",style:TextStyle(fontSize: 17)),
                    Text("-\$5",style:TextStyle(color:Colors.black54,fontSize: 17)),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Total",style:TextStyle(fontSize: 17)),
                    Text("\$25",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                  ],
                ),
              ]
          ),
              const SizedBox(height:20),
              PaymentMethod(),
              SizedBox(height:mq.height*0.09),

          
          ],),
        ),
      )
    );
  }
}


class ContainerWidget extends StatelessWidget {
  final contains;
  const ContainerWidget({
    super.key,
    this.contains
  });

  @override
  Widget build(BuildContext context) {
        final mq = MediaQuery.of(context).size;

    return Container(
      width:mq.width,
      padding:const EdgeInsets.fromLTRB(16, 14, 12, 14),
      decoration:BoxDecoration(
          color:const Color(0xFFF9F9F9),
          borderRadius: BorderRadius.circular(12),
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: 
          contains
        
      )
      
      );
  }
}