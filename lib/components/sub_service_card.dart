import 'package:flutter/material.dart';

class SubServiceCard extends StatelessWidget {
  const SubServiceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      constraints: BoxConstraints.tight(MediaQuery.of(context).size / 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius. all(Radius. circular(20)),
            color: Colors.amberAccent),
      child: Center(child: Text('test',style: TextStyle(
        fontSize: 20,
      ),)),
    );
  }
}
