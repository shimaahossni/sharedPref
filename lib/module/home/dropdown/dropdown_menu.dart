import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:shared/module/home/dropdown/show_popup_over.dart';
class dropDownMenu extends StatelessWidget {
  const dropDownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaquery=MediaQuery.of(context).size;
    return GestureDetector(
      onTap:() => showPopover(
        context: context,
        bodyBuilder: (context) => showPopUpOver(),
        width: 110,
        height: 110,
        backgroundColor: Colors.grey.shade100

      ),
      child: Icon(Icons.more_vert,size: mediaquery.width*.07,color: Colors.orange,),
    );
  }
}
