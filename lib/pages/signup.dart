import 'package:courier_app/pages/login.dart';
import 'package:courier_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget{
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final formkey = GlobalKey<FormState>();
  bool remembericon = false;
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation:0,
          leading:Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap:(){
                Navigator.pop(context);
              },
              child: Container(
                decoration:BoxDecoration(color: Palette.primarycolor,
                borderRadius: BorderRadius.circular(8)
                
                ),
                
                child:const Icon(Icons.arrow_back_ios,color:Colors.white)
              ),
              ),
          )
        ),
        body:  SingleChildScrollView(

        child: Form(
          key:formkey,
          child:Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height:mq.height*0.02),
              const Text("Hello! Register to get started",style:TextStyle(fontSize: 20,fontWeight: FontWeight.w500)),
              SizedBox(height:mq.height*0.03),
              inputLabel(label:"Name"),
              const SizedBox(height:3),
                    const makeInput(label:"Name",
                    icon:Icon(Icons.person_2_outlined),
                    ),
              SizedBox(height:mq.height*0.02),
            inputLabel(label:"Email"),
              const SizedBox(height:3),
                    const makeInput(label:"Email",
                    icon:Icon(CupertinoIcons.mail),
                    ),
              SizedBox(height:mq.height*0.02),
            inputLabel(label:"Phone Number"),
              const SizedBox(height:3),
                    const makeInput(label:"Phone Number",
                    icon:Icon(CupertinoIcons.phone),
                    ),
              SizedBox(height:mq.height*0.02),
            inputLabel(label:"Password"),
              const SizedBox(height:3),
                    const makeInput(label:"Password",
                    icon:Icon(Icons.lock_outline),
                    ),
              SizedBox(height:mq.height*0.02),
            inputLabel(label:"Confirm Password"),
              const SizedBox(height:3),
                    const makeInput(label:"Confirm Password",
                    icon:Icon(Icons.lock_outline),
                    ),


                SizedBox(height:mq.height*0.05),
                GestureDetector(
                  onTap:(){

                  },
                  child:Container(
                    width:mq.width,
                    height:mq.height*0.07,

                    decoration:BoxDecoration(
                      color:Palette.primarycolor,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child:const Center(child: Text("Register",style:TextStyle(color:Colors.white,fontSize:20)))
                  )
                ),
                SizedBox(height:mq.height*0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  const Text("Already have an account? ",style:TextStyle(fontSize: 17,color:Colors.black54)),
                  InkWell(
                    onTap:(){
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Login()));
                    },
                    child: const Text("Log In",style:TextStyle(color:Colors.black,fontSize: 18)),
                  )
                ],)
            ],),
          )),
    )

        )
      );
  }

  Widget inputLabel(
    {label}
  ){
    return    Text(label,style:const TextStyle(fontSize: 15,letterSpacing: 1));

  }
  

}

class makeInput extends StatelessWidget {
  const makeInput({
    required this.label,
    required this.icon,
    super.key,
  });
  final String label;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorHeight: 24,             
      decoration:  InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical:0,horizontal: 14),
      hintText: label, 
      hintStyle: const TextStyle(color:Colors.black54,letterSpacing: 1), 
      prefixIcon:icon,
      fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide:const BorderSide(color:Colors.grey),
          borderRadius: BorderRadius.circular(8)
          
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:const BorderSide(color:Palette.primarycolor),
          borderRadius: BorderRadius.circular(8)
                  
        )
      ),
      
    );
  }
}