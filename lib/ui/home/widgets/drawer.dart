import 'package:dvt_weather/ui/constants/constants.dart';
import 'package:dvt_weather/ui/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final String assetName = 'assets/svg/splash.svg';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        DrawerHeader(
            child: SizedBox(
          height: screenHeight(context) * 0.2,
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight(context) * 0.1,
                      child: SvgPicture.asset(
                        assetName,
                      ),
                    ),
                    const Text("DVT Weather")
                  ],
                ),
              ),
        )),
        InkWell(
          child: const ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
          onTap: () {
            Navigator.pushNamed(context, SettingsScreen.routeName);
          },
        ),
        InkWell(
          onTap: () {
            showAppDialog(
              context,
              AlertDialog(
                title: const Text('Leaving Already? :('),
                content: const Text('Do you want to exit DVT Weather?'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text('No'),
                  ),
                  TextButton(
                    onPressed: () =>
                        Future.delayed(const Duration(milliseconds: 1000), () {
                      SystemChannels.platform
                          .invokeMethod('SystemNavigator.pop');
                    }),
                    child: const Text('Yes'),
                  ),
                ],
              ),
            );
          },
          child: const ListTile(
            leading: Icon(Icons.exit_to_app_rounded),
            title: Text('Exit'),
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            //todo
            // I wanted to use the package info package to show the app's version but it was throwing an exception,
            // if I have time I will get back to it and work on it but for now I will hard code the version
            child: Text(
              "Version: ${0.1}",
              style: const TextTheme().bodyMedium,
            ),
          ),
        ))
      ]),
    );
  }
}
