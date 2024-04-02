import 'package:courier_app/pages/check_rates.dart';
import 'package:courier_app/pages/create_order.dart';
import 'package:courier_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceandPackageWidget extends StatelessWidget{
  const PriceandPackageWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Row(children: [
      //Send Package
      RowElements(
        nextpage:(){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>CreateOrderPage()));

        } ,
        icontype: const Icon(CupertinoIcons.gift,color: Colors.white,size:30),
        text:"Send Package"
      ),

      SizedBox(width:30),
      RowElements(
        nextpage:(){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>CheckRatePage()));

        } ,
        icontype: const Icon(CupertinoIcons.money_dollar,color: Colors.white,size:30),
        text:"Check Rates"
      )

    ],);
  }

}

class RowElements extends StatelessWidget {
  const RowElements({
    super.key,
    required this.nextpage,
    required this.icontype,
    required this.text,
  });
  final Icon icontype;
  final VoidCallback nextpage;
  final String text;

  @override
  Widget build(BuildContext context) {
  final mq = MediaQuery.of(context).size;

    return GestureDetector(
      onTap:nextpage,
      child: Container(
        width:mq.width*0.35,
        padding:const EdgeInsets.only(top:10,bottom:10),
        margin: const EdgeInsets.only(left:10),
        decoration: BoxDecoration(
              color:Colors.white,
              borderRadius: BorderRadius.circular(9),
            boxShadow: const [
                  BoxShadow(
                  color:Color.fromRGBO(218, 218, 218, 0.45),
                  blurRadius:1,
                  spreadRadius:0,
                  offset:Offset(1,1)
                  ),
                  BoxShadow(
                  color:Color.fromRGBO(218, 218, 218, 0.45),
                    blurRadius:1,
                    spreadRadius:0,
                    offset:Offset(-1,-1)
                    ),
              
                  ]
    
        ),
        child:Column(children: [
          CircleAvatar(
            radius:30,
            backgroundColor: Palette.primarycolor,
            child:icontype 
            ),
          SizedBox(height:10),
          Text(text,style:TextStyle(fontWeight: FontWeight.bold))
        ],)
      ),
    );
  }
}