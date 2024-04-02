import 'package:courier_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CouponCode extends StatelessWidget{
  const CouponCode({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(right:20,bottom:40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
             Text("Coupon",style:GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 20)),
             SizedBox(height:10),
             TextFormField(
              cursorHeight: 20,
              decoration: InputDecoration(
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap:(){

                      },
                      child:Container(
                        padding: const EdgeInsets.fromLTRB(8,5,8,2),
                        margin: const EdgeInsets.only(right:5),
                        decoration:BoxDecoration(
                          border:Border.all(color:Palette.primarycolor),
                          borderRadius: BorderRadius.circular(6),
                          color:Colors.white
                        ),
                        child:const Text("Add",style:TextStyle(color:Palette.primarycolor,fontWeight: FontWeight.w700))
                      )
                    ),
                  ],
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal:10),
                hintText: "Enter Coupon Code",
                fillColor: const Color(0xFFF0EFF5),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color:Color(0xFFF0EFF5)),
                borderRadius: BorderRadius.circular(8),
                
                ),
                  focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color:Palette.primarycolor),
                borderRadius: BorderRadius.circular(8),
                
                )

              ),

              
             )
    
      ],),
    );
  }

}