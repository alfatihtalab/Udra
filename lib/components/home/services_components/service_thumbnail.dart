import 'package:flutter/material.dart';
import 'package:flutter_hosham_app/components/cards/material_card.dart';
import 'package:flutter_hosham_app/models/udra_service.dart';

class ServiceThumbnail extends StatelessWidget {
  ServiceThumbnail({Key? key, required this.udraService, required this.onClick})
      : super(key: key);

  final UdraService udraService;
  VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(12),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Icon(
                udraService.iconData,
                size: 40,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Wrap(children: [
                  Text(udraService.name,
                      softWrap: true,
                      //maxLines: 2,
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.center,
                      textWidthBasis: TextWidthBasis.longestLine,
                      style: TextStyle(fontSize: 14)),
                ]),
              ],
            )
          ],
        ),
      ),
    );
  }
}
