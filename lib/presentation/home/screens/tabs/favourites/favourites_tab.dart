import 'package:dvt_weather/controller/bloc/favourites/favourites_bloc.dart';
import 'package:dvt_weather/presentation/constants/constants.dart';
import 'package:dvt_weather/presentation/home/screens/tabs/favourites/widgets/favourite_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavouritesTab extends StatefulWidget {
  const FavouritesTab({super.key});

  @override
  State<FavouritesTab> createState() => _FavouritesTabState();
}

class _FavouritesTabState extends State<FavouritesTab> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight(context),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: AnimationLimiter(
          child: BlocBuilder<FavouritesBloc, FavouritesState>(
              builder: (context, state) {
            return state.favourites.length != 0
                ? ListView.builder(
                    itemCount: state.favourites.length,
                    itemBuilder: (context, index) {
                      return AnimationConfiguration.staggeredList(
                          position: index,
                          child: SlideAnimation(
                              horizontalOffset: -60,
                              verticalOffset: -30,
                              child: FadeInAnimation(
                                  child: FavouriteItem(
                                favourite: state.favourites[index],
                              ))));
                    },
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: screenWidth(context) * 0.4,
                          width: screenWidth(context) * 0.4,
                          child: SvgPicture.asset(
                            "assets/svg/void.svg",
                            fit: BoxFit.contain,
                          ),
                        ),
                        addVerticalHeight(10),
                        Text("No Favourites...")
                      ],
                    ),
                  );
          }),
        ),
      ),
    );
  }
}
