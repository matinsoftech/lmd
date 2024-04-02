import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../widgets/coupon_code.dart';
import '../widgets/delivery_type.dart';
import '../widgets/parcel_dimensions.dart';
import '../widgets/parcel_type.dart';
import '../widgets/parcel_weight.dart';

class CreateOrderThirdPage extends StatefulWidget {
  const CreateOrderThirdPage({super.key});

  @override
  State<CreateOrderThirdPage> createState() => _CreateOrderThirdPageState();
}

class _CreateOrderThirdPageState extends State<CreateOrderThirdPage> {
    bool parcel_fragile = true;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            const Text("About Package",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
            const Text("Please enter the details below",style: TextStyle(color:Colors.black54)),

            const SizedBox(height:12),
            Container(
              padding:const EdgeInsets.fromLTRB(6, 8, 6, 8),
              decoration:BoxDecoration(
                color:const Color.fromARGB(255, 230, 222, 237),
                border: Border.all(color:Colors.purple),
                borderRadius: BorderRadius.circular(8),
              ),
              child:Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                Text("Note: ",style: TextStyle(fontWeight: FontWeight.bold),),
                Expanded(child: Text(
                  "Your given product details will be rechecked by our delivery partner during the pickup.",
                  style:TextStyle(color:Colors.black)
                  ))
              ],)
            ),
            const SizedBox(height:15),
            ParcelType(),
            const SizedBox(height:10),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            const PackageFormText(text: "Weight", textSize: 14),
            ParcelWeight(),
            
            //ParcelDimension
            const SizedBox(height:10),
            
            ParcelDimension(),
            
              ],
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


        ],
      ) ;
  }
}