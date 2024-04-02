import 'package:courier_app/widgets/parcel_weight.dart';
import 'package:flutter/material.dart';

import '../pages/check_rates.dart';

class ParcelDimension extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

     final mq = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PackageFormText(text: "Quantity", textSize: 14),
                const SizedBox(height:5),
                PackageDimensionForm(mq: mq,
                hinttext: "Quantity",
                )

              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PackageFormText(text: "Length", textSize: 14),
                const SizedBox(height:5),
                PackageDimensionForm(mq: mq,
                hinttext: "0 Mm",
                )
              ],
            ),
          ],
        ),

        const SizedBox(height:10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PackageFormText(text: "Width", textSize: 14),
                const SizedBox(height:5),
                PackageDimensionForm(mq: mq,
                hinttext: "0 Mm",

                )

              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PackageFormText(text: "Height", textSize: 14),
                const SizedBox(height:5),
                PackageDimensionForm(mq: mq,
                hinttext: "0 Mm",

                )
              ],
            ),
          ],
        ),

      ],
    );
  }

}

class PackageDimensionForm extends StatelessWidget {
  const PackageDimensionForm({
    super.key,
    required this.mq,
    required this.hinttext,
  });

  final Size mq;
  final String hinttext;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:mq.width*0.42,
      child: TextFormField(
        decoration:InputDecoration(
          
          fillColor: Colors.white,
          filled:true,
          hintText: hinttext,
          contentPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide:BorderSide.none,
            borderRadius: BorderRadius.circular(6),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(6),
          )
      
        )
      ),
    );
  }
}