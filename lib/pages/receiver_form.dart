
import 'package:flutter/material.dart';

import '../components/form_fieldWidget.dart';
import '../googleMap/places_auto_complete_screen.dart';
import '../utils/colors.dart';

class ReceiverFormPage extends StatefulWidget {
  const ReceiverFormPage({super.key});

  @override
  State<ReceiverFormPage> createState() => _ReceiverFormPageState();
}

class _ReceiverFormPageState extends State<ReceiverFormPage> {

  final name = TextEditingController();
  final phone_number = TextEditingController();
  final address = TextEditingController();
  final searchedaddress = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:20.0),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            const Text("Receiver Details",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
            const Text("Please enter the details below",style: TextStyle(color:Colors.black54)),

            const SizedBox(height:12),

          FormFieldWidget(controller: name,
          label:"Receiver Name",
          hint:"Enter receiver name",
          icon:Icons.person,
          readonly: false, 
          tapped:(){},        
       
          ),
        const SizedBox(height:16),
        FormFieldWidget(controller: phone_number,
          label:"Mobile Number",
          hint:"Enter receiver mobile number",
          icon:Icons.call,
          readonly: false, 
          tapped:(){},        
      
          ),
        const SizedBox(height:16),
        FormFieldWidget(controller: address,
          label:"Delivery Address",
          hint:"Enter delivery address",
          icon:Icons.house,
          readonly:false,
          tapped:(){},        
      
          ),
        const SizedBox(height:14),
        FormFieldWidget(controller: searchedaddress,
          label:"Delivery Address by Searching",
          hint:"Pick delivery address",
          icon:Icons.place,
          readonly:true,
          tapped:() async{
            var deliveryLocation = await Navigator.push(
              context,MaterialPageRoute(builder:(context)=>PlacesAutoCompleteScreen())
            );
          if(deliveryLocation!=null){
              setState(() {
                searchedaddress.text = deliveryLocation;
              });
            }else{
              setState(() {
                searchedaddress.text= "";
              });
            }
          },        

          ),


        ],
      ),
    );
  }
}

