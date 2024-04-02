
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/payment_method.dart';

class CreateOrderLastPage extends StatefulWidget {
  const CreateOrderLastPage({super.key});

  @override
  State<CreateOrderLastPage> createState() => _CreateOrderLastPageState();
}

class _CreateOrderLastPageState extends State<CreateOrderLastPage> {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return  Column(
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

          
          ],);

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