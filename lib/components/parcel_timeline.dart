import 'package:courier_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ParcelTimelineTile extends StatelessWidget{
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final String txt1;
  final String txt2;
  const ParcelTimelineTile({super.key,
  required this.isFirst,
  required this.isLast,
  required this.isPast,
  required this.txt1,
  required this.txt2,
  
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height:60,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: LineStyle(color:isPast?Palette.primarycolor:Color.fromARGB(255, 211, 232, 230)),
        indicatorStyle: IndicatorStyle(
          width:28,
          color:isPast?Palette.primarycolor:const Color.fromARGB(255, 211, 232, 230),
          iconStyle: IconStyle(iconData: Icons.done,color:isPast?Colors.white:Color.fromARGB(255, 211, 232, 230))
        ),
        endChild: EventCard(
              status: txt1,date:txt2
        ),
      ),
    );
  }

}

class EventCard extends StatelessWidget{
  final String status;
  final String date;
  const EventCard({super.key,
  required this.status,required this.date
  });
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 10, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text(status,style:const TextStyle(fontSize: 17,fontWeight: FontWeight.w500)),
            const SizedBox(height:3),
            Text(date,style:const TextStyle(color:Colors.black54,fontWeight: FontWeight.w500))
      ],),
    );
  }

}