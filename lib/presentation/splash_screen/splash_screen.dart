import 'package:dvt_weather/controller/cubit/bg_image/bg_image_theme_cubit.dart';
import 'package:dvt_weather/controller/cubit/theme/theme_cubit.dart';
import 'package:dvt_weather/res/functions/functions.dart';
import 'package:dvt_weather/presentation/constants/constants.dart';
import 'package:dvt_weather/presentation/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final String assetName = 'assets/svg/splash.svg';



  Future<void> delayedNavigation() async {
    ThemeCubit theme = BlocProvider.of<ThemeCubit>(context, listen: false);
    BgImageThemeCubit bgImageTheme = BlocProvider.of<BgImageThemeCubit>(context, listen: false);

    isDarkPrefs().then((value) {
      theme.changeTheme(value);
    });
    getThemePrefs().then((value){
      bgImageTheme.changeTheme(value);
    });
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
          context, HomeScreen.routeName, (route) => false);
    });
  }

  @override
  void initState(){
    determinePosition().then((value) {
      delayedNavigation();
    });
    super.initState();
  }




    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Stack(
          children: [
            Center(
              child: Container(
                height: screenHeight(context),
                width: screenWidth(context),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/weather_sock.jpg"),
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            SizedBox(
              height: screenHeight(context),
              width: screenWidth(context),
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight(context) * 0.1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      height: screenHeight(context) * 0.35,
                      // color: Colors.amber,
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: screenWidth(context) * 0.5,
                              width: screenWidth(context) * 0.5,
                              child: SvgPicture.asset(
                                assetName,
                              ),
                            ),
                            const Text(
                              "DVT Weather",
                              style: titleStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: screenHeight(context) * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const CircularProgressIndicator(
                          ),
                          addVerticalHeight(10),
                          const Text("Loading...")
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }
  }
