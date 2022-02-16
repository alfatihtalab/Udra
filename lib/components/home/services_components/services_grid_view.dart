import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hosham_app/components/home/services_components/service_thumbnail.dart';
import 'package:flutter_hosham_app/generated/locale_keys.g.dart';
import 'package:flutter_hosham_app/models/udra_service.dart';
import 'package:flutter_hosham_app/screens/sub_services_screen/sub_services_list.dart';
import 'package:get/get.dart';

class ServicesGridView extends StatelessWidget {
  // 2
  //final List<ExploreRecipe> recipes;

  const ServicesGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 3
    return Padding(
      padding: const EdgeInsets.only(
          // left: 16,
          // right: 16,
          // top: 16,
          ),
      // 4
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 5
          Text(LocaleKeys.services, style: Theme.of(context).textTheme.headline2).tr(),
          // 6
          const SizedBox(height: 16),
          // 7
          GridView.builder(
            //crossAxisCount: 2,
            // 3
            //scrollDirection: Axis.vertical,
            // 4
            //itemCount: 6,
            // 5
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: udraServicesList.length,
            itemBuilder: (context, index) {
              // 6
              final urdaService = udraServicesList[index];
              return ServiceThumbnail(
                udraService: urdaService,
                onClick: () {
                  Get.to(SubservicesListPage(service: urdaService));
                },
              );
            },
            // 7
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
