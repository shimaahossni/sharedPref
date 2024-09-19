import 'package:flutter/material.dart';
class MaterialCustomButton extends StatelessWidget {

  final String name;

   MaterialCustomButton({super.key,required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.0),
      child: MaterialButton(
        child: Text(name),
        onPressed: () {  },
      ),
    );
  }
}
