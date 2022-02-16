import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hosham_app/components/cards/material_card.dart';
import 'package:flutter_hosham_app/components/circular_image.dart';
import 'package:flutter_hosham_app/components/home/news/news_list_views.dart';
import 'package:flutter_hosham_app/controller/theme_controller.dart';
import 'package:flutter_hosham_app/generated/codegen_loader.g.dart';
import 'package:flutter_hosham_app/generated/locale_keys.g.dart';
import 'package:flutter_hosham_app/screens/about_screen.dart';
import 'package:flutter_hosham_app/screens/auth/login.dart';
import 'package:flutter_hosham_app/theme_app.dart';
import 'package:get/get.dart';

import '../../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _controller;
  late ThemeController themeController;
  late bool isDark;
  int _selectedIndex = 0;

  static List<Widget> pages = [NewsListView(), MaterialCard(), AboutPage()];

  @override
  void initState() {
    // TODO: implement initState
    _controller = PageController(
      initialPage: 0,
    );
    //_controller.addListener(scrollListener);
    themeController = ThemeController(persistence);
    themeController.getToggeldValue();
    isDark = themeController.isToggled;

    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: CircleImage(name: 'Guest')),
                  Text(
                    LocaleKeys.guest,
                    style: DemoTheme.darkTextTheme.headline2,
                  ).tr(),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: Text(LocaleKeys.title).tr(),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: const Icon(Icons.translate),
              title: const Text(LocaleKeys.language).tr(),
              onTap: () {
                showLanguageDialoug();
                // Update the state of the app.
                // ...
                // final snackBar = SnackBar(
                //   behavior: SnackBarBehavior.floating,
                //   content: Text('Coming soon ...'),
                //   action: SnackBarAction(
                //     label: 'Action',
                //     onPressed: () {},
                //   ),
                // );

                // Find the Scaffold in the widget tree and use
                // it to show a SnackBar.
                // ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
            ListTile(
              leading: const Icon(Icons.dark_mode_outlined),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(LocaleKeys.dark_mode).tr(),
                  Switch(
                      value: isDark,
                      onChanged: (v) {
                        themeController.setDark(v);
                        Get.changeTheme(themeController.theme);
                        setState(() {
                          isDark = v;
                        });
                      }),
                ],
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: Text(LocaleKeys.logout).tr(),
              onTap: () {
                // Update the state of the app.
                // ...
                userController.loggedOut();
                Get.offAll(const LoginPage());
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(LocaleKeys.title).tr(),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: pages[_selectedIndex],
      )),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: const Icon(Icons.arrow_downward_rounded),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        // iconSize: 28,
        // selectedFontSize: 18,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.wysiwyg),
            label: tr(LocaleKeys.news),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: tr(LocaleKeys.events_text),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: tr(LocaleKeys.about_us),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Future<void> showLanguageDialoug() async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Select Language'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    context.setLocale(Locale("en"));
                  });
                },
                child: const Text(LocaleKeys.language_text_en).tr(),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    context.setLocale(Locale("ar"));
                  });
                },
                child: const Text(LocaleKeys.language_text_ar).tr(),
              ),
            ],
          );
        })) {
      case Locale:
        // Let's go.
        // ...
        break;
      case Locale:
        // ...
        break;
      case null:
        // dialog dismissed
        break;
    }
  }
}
