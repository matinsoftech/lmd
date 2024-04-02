import 'package:courier_app/utils/colors.dart';
import 'package:flutter/material.dart';

class ParcelWeight extends StatefulWidget{
  @override
  State<ParcelWeight> createState() => _ParcelWeightState();
}

class _ParcelWeightState extends State<ParcelWeight> {

  List<String> parcel_weight = ["Up to 1 kg","Up to 5 kg","Up to 10 kg","Up to 15 kg","Up to 20 kg"];
  String selectedparcelweight = "Up to 1 kg";
  bool weightselected = false;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      GestureDetector(
        onTap:(){
          showBottomSheet(context: context, builder: (context){
              return Container(
                decoration:const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight: Radius.circular(20)),
                  color:Color(0xFFF0EFF5)
                ),
                padding:const EdgeInsets.all(20),
                height:330,
                width:mq.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    const Text("Parcel Weight",style:TextStyle(fontWeight: FontWeight.w500,fontSize: 20)),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: parcel_weight.length,
                      itemBuilder:(context,index){
                          return GestureDetector(
                            onTap:(){
                              setState(() {
                                selectedparcelweight = parcel_weight[index];
                              });
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(parcel_weight[index],style:const TextStyle(color:Colors.black,fontSize: 18)),
                                  parcel_weight[index]==selectedparcelweight?const Icon(Icons.check,color:Palette.primarycolor):SizedBox.shrink()
                                ],
                              ),
                            ));
                    }),
                  ],
                )
                );
          });
        },
        child:PackageWeightSelect(
          selectedparcelweight: selectedparcelweight,
          containerColor: Colors.white,
          
          )
      )
    ],);
  }
}

class PackageWeightSelect extends StatelessWidget {
  const PackageWeightSelect({
    super.key,
    required this.selectedparcelweight,
    required this.containerColor,
  });
  final Color containerColor; 

  final String selectedparcelweight;

  @override
  Widget build(BuildContext context) {
    return Container( 
      padding:const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color:containerColor,
        borderRadius: BorderRadius.circular(12)
                    
      ),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         Row(
           children:  [
             const Icon(Icons.balance,),
             const SizedBox(width:20),
            Text(selectedparcelweight,style:const TextStyle(fontSize: 17)),

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

    );
  }
}

class PackageFormText extends StatelessWidget {
  const PackageFormText({
    super.key,
    required this.text,
    required this.textSize,
  });
  final String text;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(fontWeight: FontWeight.bold,fontSize: textSize));
  }
}