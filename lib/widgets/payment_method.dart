import 'package:courier_app/utils/colors.dart';
import 'package:flutter/material.dart';

class PaymentMethod extends StatefulWidget{
  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {

  List<String> payment_method = ["Cash","Online"];
  String selected_payment_method = "Cash";
  bool weightselected = false;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      const Text("Payment",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
      GestureDetector(
        onTap:(){
          // showBottomSheet(context: context, builder: (context){
          //     return Container(
          //       decoration:const BoxDecoration(
          //         borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight: Radius.circular(20)),
          //         color:Color(0xFFF0EFF5)
          //       ),
          //       padding:const EdgeInsets.fromLTRB(20, 4, 20, 20),
          //       height:mq.height*0.33,
          //       width:mq.width,
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
                    
          //           const Center(
          //             child:  SizedBox(
          //               width:50,
          //               child:Divider(
          //                 thickness: 5,
          //               ),
          //               ),
          //           ),
          //           const SizedBox(height:15),
          //           const Center(child:  Text("Payment Method",style:TextStyle(fontWeight: FontWeight.w500,fontSize: 20))),
          //           const SizedBox(height:20),
          //           ListView.builder(
          //             // shrinkWrap: true,
          //             physics: NeverScrollableScrollPhysics(),
          //             itemCount: payment_method.length,
          //             itemBuilder:(context,index){
          //                 return GestureDetector(
          //                   onTap:(){
          //                     setState(() {
          //                       selected_payment_method = payment_method[index];
          //                     });
          //                     Navigator.pop(context);
          //                   },
          //                   child: Padding(
          //                     padding: const EdgeInsets.all(12.0),
          //                     child: Row(
          //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                       children: [
          //                         Text(payment_method[index],style:const TextStyle(color:Colors.black,fontSize: 18)),
          //                         payment_method[index]==selected_payment_method?const Icon(Icons.check,color:Palette.primarycolor):SizedBox.shrink()
          //                       ],
          //                     ),
          //                   ));
          //           }),
          //         ],
          //       )
          //       );
          // });
        },
        child:Container( 
          margin:const EdgeInsets.only(top:6,right:0),
          padding:const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color:const Color(0xFFF0EFF5),
            borderRadius: BorderRadius.circular(12)
                        
          ),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Row(
               children:  [
                 const Icon(Icons.money,color:Palette.primarycolor,size:30),
                 const SizedBox(width:20),
                Text(selected_payment_method,style:const TextStyle(fontSize: 17)),

               ],
             ),
              Transform.rotate(
                angle: 88 * 3.1416 / 180,
                child: const Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 16,
                  color:Colors.black45
                ),
              )


          ],)

        )
      )
    ],);
  }
}