import 'package:dvt_weather/controller/cubit/bg_image/bg_image_theme_cubit.dart';
import 'package:dvt_weather/controller/cubit/theme/theme_cubit.dart';
import 'package:dvt_weather/res/colors/colors.dart';
import 'package:dvt_weather/ui/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = "settings";
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String imageTheme = "sea";

  List<String> imageThemes = [
    "sea",
   "forest",
  ];

  Future<void> setDarkPrefs(bool isDark) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isDark", isDark);
  }

  Future<void> setThemePrefs(String theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("theme", theme);
  }


  @override
  Widget build(BuildContext context) {
    ThemeCubit theme = BlocProvider.of<ThemeCubit>(context, listen: false);
    BgImageThemeCubit bgImageTheme = BlocProvider.of<BgImageThemeCubit>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: const TextTheme().titleMedium,
        ),
      ),
      body: SizedBox(
        height: screenHeight(context),
        width: screenWidth(context),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              children: [
                SizedBox(
                  width: screenWidth(context),
                  child: Column(
                    children: [
                      Card(
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(8),
                          leading: const Icon(Icons.dark_mode),
                          title: const Text(
                            "Dark mode",
                          ),
                          trailing: Switch(
                              value: theme.isDark, //false or true
                              onChanged: (value) {
                                setDarkPrefs(value);
                                setState(() {
                                  theme.changeTheme(value);
                                });
                              }),
                        ),
                      ),
                      Card(
                        child: SizedBox(
                          width: screenWidth(context),
                          height: screenWidth(context) * 0.15,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                const Expanded(
                                  flex: 1,
                                  child: Text(
                                    "Theme:",
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: SizedBox(
                                    height: screenWidth(context) * 0.1,
                                    child: DropdownButtonFormField(
                                      decoration: InputDecoration(
                                        fillColor: complimentary.withOpacity(0.1),
                                          filled: false),
                                      value: bgImageTheme.imageTheme != ""? bgImageTheme.imageTheme : imageTheme,
                                      icon: const Icon(Icons.keyboard_arrow_down),
                                      items: imageThemes.map((item) {
                                        return DropdownMenuItem(
                                            value: item, child: Text(item));
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setThemePrefs(newValue.toString());
                                        setState(() {
                                          imageTheme = newValue.toString();
                                          bgImageTheme.changeTheme(imageTheme);
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
