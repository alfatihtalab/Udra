import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hosham_app/api/mock_app_service.dart';
import 'package:flutter_hosham_app/controller/theme_controller.dart';
import 'package:flutter_hosham_app/controller/user_controller.dart';
import 'package:flutter_hosham_app/screens/home/home_page.dart';
import 'package:flutter_hosham_app/screens/onboarding/onboarding_screen.dart';
import 'package:flutter_hosham_app/storage/persistence.dart';
import 'package:flutter_hosham_app/generated//codegen_loader.g.dart';
import 'package:flutter_hosham_app/theme_app.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences preferences;
late SharedPreferencesPersistence persistence;
late UserController userController;
late ThemeController themeController;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  preferences = await SharedPreferences.getInstance();
  persistence = SharedPreferencesPersistence(preferences);
  userController = UserController(persistence);
  themeController = ThemeController(persistence);
  themeController.getCurrentTheme();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(
            EasyLocalization(
                supportedLocales: const [Locale('en'), Locale('ar')],
                path:
                    'assets/translations', // <-- change the path of the translation files
                assetLoader: CodegenLoader(),
                fallbackLocale: Locale('en'),
                child: const MyApp()),
          ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  /// ↓↓ ADDED
  /// InheritedWidget style accessor to our State object.
  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  // ThemeData theme = DemoTheme.light();
  final ThemeMode _themeMode = ThemeMode.system;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Init.instance.initialize(),
        builder: (context, AsyncSnapshot snapshot) {
          // Show splash screen while waiting for app resources to load:
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const GetMaterialApp(
                debugShowCheckedModeBanner: false, home: Splash());
          } else {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              home: const LoadingPage(),
              theme: themeController.theme,
              darkTheme: themeController.theme,
              themeMode: _themeMode,
            );
          }
        });
    // Loading is done, return the app:
  }
}

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  ApiServices apiServices = Get.put(ApiServices());

//open login page after delay
  // Future<bool> loading() async {
  //   print(userController.userStatus);
  //   await Future.delayed(const Duration(seconds: 6));
  //   return true;
  // }

  // void openLogin() {
  //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
  //     return const LoginPage();
  //   }));
  // }

  @override
  Widget build(BuildContext context) {
    userController = Get.put(UserController(persistence));

    return Scaffold(
        body: SafeArea(
            child: FutureBuilder(
      future: apiServices.checkStorage(),
      builder: (BuildContext context, AsyncSnapshot<Status> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data == Status.LoggedIn) {
            return const HomePage();
          }
          return OnBoardingPage();
        }
        return const Center(child: CircularProgressIndicator());
      },
    )));
  }
}

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool lightMode =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    Size size = MediaQuery.of(context).size;
    // ff042a49
    return Scaffold(
      backgroundColor:
          lightMode ? const Color(0xffffffff) : const Color(0xFF7B1FA2),
      body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
              child: lightMode
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: AspectRatio(
                              aspectRatio: size.height / size.width,
                              child: Image.asset('assets/main_logo.png')),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'آدرى',
                          style: DemoTheme.lightTextTheme.headline2,
                        ),
                        Text(
                          ' مستشارك التعليمي',
                          style: DemoTheme.lightTextTheme.headline2,
                        )
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: AspectRatio(
                              aspectRatio: size.height / size.width,
                              child: Image.asset('assets/main_logo.png')),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'آدرى',
                          style: DemoTheme.darkTextTheme.headline2,
                        ),
                        Text(
                          ' مستشارك التعليمي',
                          style: DemoTheme.darkTextTheme.headline2,
                        )
                      ],
                    ))),
    );
  }
}

class Init {
  Init._();
  static final instance = Init._();

  Future initialize() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!

    await Future.delayed(const Duration(seconds: 2));
  }
}
