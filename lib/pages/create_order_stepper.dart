import 'package:courier_app/pages/create_order_last_page.dart';
import 'package:courier_app/pages/create_order_third_page.dart';
import 'package:courier_app/pages/receiver_form.dart';
import 'package:courier_app/pages/sender_form.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'order_request_sucesspage.dart';

class CreateOrderStepper extends StatefulWidget {
  const CreateOrderStepper({super.key});

  @override
  State<CreateOrderStepper> createState() => _CreateOrderStepperState();
}

class _CreateOrderStepperState extends State<CreateOrderStepper> {
  
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xFFF5F4F7),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child:Container(
              padding: EdgeInsets.only(left:6),
              color:const Color(0xFFF5F4F7),
              child:Row(children: [
                    TextButton(
                              child: const Text(
                    "Back",style:TextStyle(color:Colors.black54,fontSize: 18)),
                    onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>RootScreen(user: 'User',)));
                    },
                    ),
    
              ],)
            )
          ),
          
          body:Padding(
            padding: const EdgeInsets.only(top:10.0),
            child: Container(
          color: const Color(0xFFF5F4F7),
              child: Stepper(
                
                elevation:0,
                type: StepperType.horizontal,
                steps: getSteps(),
                currentStep: currentStep,
                onStepTapped: (step) => setState(() {
                  currentStep = step;
                }),
                onStepContinue: () {
                  final isLastStep = currentStep == getSteps().length-1;
                    
                  if(isLastStep){
                    Navigator.push(context,MaterialPageRoute(builder: (context) => OrderRequestPage(),));
                  }
                  else{
                  setState(() {
                    currentStep+=1;
                  });
                    
                  }
                },
                onStepCancel: () {
                  
                  currentStep == 0?null:
                  setState(() {
                    currentStep-=1;
                  });
                },
                controlsBuilder:(context,details){
                  final isLastStep = currentStep == getSteps().length-1;
                    
                  return Container(
                    child:Row(
                      children: [
                      Expanded(child: ElevatedButton(onPressed: details.onStepContinue, child: Text(isLastStep?'Confirm':"Next"))),
                      const SizedBox(width:6),
                      if(currentStep!=0)
                      Expanded(child: ElevatedButton(onPressed: details.onStepCancel, child: const Text("Back")))
                      else
                      Expanded(child: ElevatedButton(
                      onPressed:(){
                        Navigator.push(context,MaterialPageRoute(builder: (context) => RootScreen(user: "User",),)) ;
                      },
                      child: Text("Back")))

                    ],)
                  );
                },
                ),
            ),
          ),
    
            
      ),
    );
    
  }

  List<Step> getSteps()=>[
    Step(
      isActive: currentStep >=0,
      title:const Text(""),
      content:SenderFormPage()
      ),
    Step(
      isActive: currentStep>=1,
      title:const Text(""),
      content:ReceiverFormPage()
      ),
      Step(
      isActive: currentStep>=2,  
      title:const Text(""),
      content:CreateOrderThirdPage()
      ),
    Step(
      isActive: currentStep>=3,
      title:const Text(""),
      content:CreateOrderLastPage()
      ),

  ];
}