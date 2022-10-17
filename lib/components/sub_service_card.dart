import 'package:flutter/material.dart';

class SubServiceCard extends StatelessWidget {
  const SubServiceCard({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

      },
      child: Container(
        margin: EdgeInsets.all(16),
        constraints: BoxConstraints.tight(MediaQuery.of(context).size / 4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius. all(Radius. circular(20)),
              color: Color.fromARGB(182, 255, 128, 0)),
        child: Center(child: Text(
          name ,
          // softWrap: true,
          textAlign: TextAlign.center,
          // overflow: TextOverflow.visible,
          style: TextStyle(
          fontSize: 18,

        ),)),
      ),
    );
  }
}
