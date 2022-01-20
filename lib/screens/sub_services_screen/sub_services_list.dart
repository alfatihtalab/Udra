import 'package:flutter/material.dart';
import 'package:flutter_hosham_app/models/udra_service.dart';

class SubservicesListPage extends StatefulWidget {
  SubservicesListPage({Key? key, required this.service}) : super(key: key);

  final UdraService service;

  @override
  _SubservicesListPageState createState() => _SubservicesListPageState();
}

class _SubservicesListPageState extends State<SubservicesListPage> {
  late UdraService service;

  @override
  void initState() {
    // TODO: implement initState
    service = widget.service;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        title: Text(
          service.name,
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: service.list?.length ?? 1,
            itemBuilder: (context, index) {
              return service.list != null
                  ? ListTile(
                      onTap: () {
                        const snackBar = SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content: Text('Comming soon ...'),
                          // action: SnackBarAction(
                          //   label: 'Action',
                          //   onPressed: () {},
                          // ),
                        );

                        // Find the Scaffold in the widget tree and use
                        // it to show a SnackBar.
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      title: Text(
                        service.list![index].name,
                        style: TextStyle(fontSize: 18),
                      ),
                      leading: Icon(Icons.label),
                      //trailing: Text(service.list![index].name),
                    )
                  : Container(
                      height: MediaQuery.of(context).size.width,
                      child: const Center(
                        child: Text(
                          "Coming soon ...",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
            }),
      ),
    );
  }
}
