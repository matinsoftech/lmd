import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ParcelType extends StatefulWidget{
  @override
  State<ParcelType> createState() => _ParcelTypeState();
}

class _ParcelTypeState extends State<ParcelType> {

  List<String> parcel_type = ["Documents","Food","Cloth","Groceries","Flowers","Cake"];
  String selectedparcel_type = "Documents";
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

      const Text("What are you sending?",style:TextStyle(color:Colors.black,fontWeight: FontWeight.bold)),
          SizedBox(
            height:mq.height*0.047,
            child: TextFormField(
              decoration: InputDecoration(
              // labelText: "What are you sending?",
              hintText: selectedparcel_type,
              labelStyle: const TextStyle(color:Colors.black45,fontSize: 16),
              contentPadding: EdgeInsets.symmetric(vertical: 10.0),
              )
            
            ),
          ),
          Container(
            height:60,
            width:mq.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: parcel_type.length,
              itemBuilder: (context,index){
                return GestureDetector(
                  onTap:(){
                    setState(() {
                      selectedparcel_type = parcel_type[index];
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 12, 12, 12),
                    padding:const EdgeInsets.fromLTRB(12, 6, 12, 6),
                    decoration:BoxDecoration(borderRadius: BorderRadius.circular(12),
                    color:const Color(0xFFF0EFF5),
                    ),
                    child:Center(child: Text(parcel_type[index],style:TextStyle(fontWeight: FontWeight.w400,letterSpacing: 1)))
                  ),
                );
              }
              ),
          )
    ]);
  }
}