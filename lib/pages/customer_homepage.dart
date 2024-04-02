import 'package:courier_app/main.dart';
import 'package:courier_app/pages/profile_page.dart';
import 'package:courier_app/pages/track_parcel.dart';
import 'package:courier_app/utils/colors.dart';
import 'package:courier_app/widgets/our_services.dart';
import 'package:courier_app/widgets/recent_delivery.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/customer_drawer.dart';
import '../widgets/price_and_package.dart';

class CustomerHomePage extends StatefulWidget{
  const CustomerHomePage({super.key});

  @override
  State<CustomerHomePage> createState() => _CustomerHomePageState();
}

class _CustomerHomePageState extends State<CustomerHomePage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {

    final mq = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        key:_scaffoldKey,
        drawer:CustomerDrawer(),
        appBar: AppBar(
          backgroundColor: Palette.primarycolor,
          elevation:0,
          leading: IconButton(icon: const Icon(Icons.menu,color:Colors.white),onPressed: (){
          _scaffoldKey.currentState?.openDrawer();
          },),
          title:Image.asset('assets/logo.png',height:140,width:140),

          actions: [
            IconButton(onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>ProfilePage('')));
            }, icon:const Icon(CupertinoIcons.person,color:Colors.white))
          ],
          
    
        ),
        body:SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left:15.0,right:10,),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Container(
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(4),
                  //     color:Palette.fillgreenColor
                  //   ),
                  //   // padding: EdgeInsets.all(8),
                  //   margin:const EdgeInsets.fromLTRB(24, 12, 0,0),
                  //   child: IconButton(icon:Icon(Icons.arrow_back_ios),onPressed: (){},)),
                  // SizedBox(height:mq.height*0.03),
              Container(
                margin:const EdgeInsets.fromLTRB(0,30,0, 15),
                child:Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding:const EdgeInsets.all(10),
                      decoration:  BoxDecoration(
                        color:Palette.fillgreenColor,
                        borderRadius: BorderRadius.circular(6)
                        // border:Border.all(color:Colors.grey)
                      ),
                      child: const Icon(Icons.place,size:40,color:Palette.primarycolor)),
                    const SizedBox(width:12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const[
                      Text("Your Location",style:TextStyle(fontSize: 16,color:Colors.black45)),
                      SizedBox(height:5),
                      Text("Biratnagar, Nepal",style:TextStyle(fontWeight: FontWeight.w500,fontSize: 20)),
                    ],)
                  ],
                )
              ),
              //Track package
                  
              Container(
                width:mq.width,
                margin:const EdgeInsets.fromLTRB(0,0,0, 15),
                padding:const EdgeInsets.fromLTRB(20, 14, 10, 20),
                decoration: BoxDecoration(
                  color: Palette.fillgreenColor,
                  borderRadius: BorderRadius.circular(12),
                  
                ),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Track your package",style:TextStyle(fontWeight: FontWeight.w800,fontSize: 19)),
                    const SizedBox(height:6),
                    const Text("Please enter your tracking number",style:TextStyle(fontSize:15)),
                    const SizedBox(height:12),
                  
                    TextFormField(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>TrackParcel()));
                      },
                      cursorHeight: 24,             
                      decoration:  InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical:0,horizontal: 14),
                      hintText: "Tracking Number", 
                      hintStyle: const TextStyle(color:Colors.black54,letterSpacing: 1), 
                      prefixIcon:const Icon(CupertinoIcons.cube),
                      fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide:const BorderSide(color:Colors.white),
                          borderRadius: BorderRadius.circular(12)
                          
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:const BorderSide(color:Colors.white),
                          borderRadius: BorderRadius.circular(12)
                  
                        )
                      ),
                      
                    )
                ],)
              ),
            //Check rates and send package
            PriceandPackageWidget(),

            //Recent Delivery 
              const SizedBox(height:20),
   
              const RecentDelivery(),

              //Our Services
              const SizedBox(height:20),
              OurServices(),
            
              ],),
            ),
          ),
        )
      ),
    );
  }
}