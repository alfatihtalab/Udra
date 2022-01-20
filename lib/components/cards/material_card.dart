import 'package:flutter/material.dart';

class MaterialCard extends StatefulWidget {
  MaterialCard({Key? key}) : super(key: key);

  @override
  _MaterialCardState createState() => _MaterialCardState();
}

class _MaterialCardState extends State<MaterialCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      //clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.arrow_drop_down_circle),
            title: const Text('Commin soon ...'),
            subtitle: Text(
              'An event helps you to be in touch with the others',
              //style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'English clubs come in many different guises. What they do all have in common, however, is that they provide an opportunity for English language learners to practise using English in a relaxed and friendly setting.',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              FlatButton(
                textColor: const Color(0xFF6200EE),
                onPressed: () {
                  // Perform some action
                },
                child: const Text('Interested'),
              ),
              FlatButton(
                textColor: const Color(0xFF6200EE),
                onPressed: () {
                  // Perform some action
                },
                child: const Text('Share'),
              ),
            ],
          ),
          Image.asset('assets/onboarding/team_dev.jpg'),
          //Image.asset('assets/onboarding/team_dev.jpg'),
        ],
      ),
    );
  }
}
