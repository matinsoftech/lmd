
import 'package:flutter/material.dart';

import '../components/form_fieldWidget.dart';
import '../utils/colors.dart';

class SenderFormPage extends StatefulWidget {
  const SenderFormPage({super.key});

  @override
  State<SenderFormPage> createState() => _SenderFormPageState();
}

class _SenderFormPageState extends State<SenderFormPage> {

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
            const Text("Sender Details",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
            const Text("Please enter the details below",style: TextStyle(color:Colors.black54)),

            const SizedBox(height:12),

        FormFieldWidget(controller: name,
          label:"Sender Name",
          hint:"Enter your name",
          icon:Icons.person,
          readonly: false,
          tapped:(){},        
          ),
        const SizedBox(height:16),
        FormFieldWidget(controller: phone_number,
          label:"Mobile Number",
          hint:"Enter your mobile number",
          icon:Icons.call,
          readonly: false, 
          tapped:(){},        
      
          ),
        const SizedBox(height:16),
        FormFieldWidget(controller: address,
          label:"Pickup Address",
          hint:"Enter your address",
          icon:Icons.house,
          readonly:false,
          tapped:(){},        
   
          ),
        const SizedBox(height:14),
        FormFieldWidget(controller: searchedaddress,
          label:"Pickup Address by Searching",
          hint:"Pick your address",
          icon:Icons.place,
          readonly:true,
          tapped:(){},        
   
          ),


        ],
      ),
    );
  }
}

