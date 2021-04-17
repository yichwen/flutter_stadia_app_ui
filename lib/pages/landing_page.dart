import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:stadia_app/common/content_heading_widget.dart';
import 'package:stadia_app/common/last_played_game_tile_widget.dart';
import 'package:stadia_app/common/rounded_image_widget.dart';
import 'package:stadia_app/model/friends.dart';
import 'package:stadia_app/model/last_played_game.dart';
import 'package:stadia_app/pages/secondary_home_page.dart';
import 'package:stadia_app/styleguide/text_styles.dart';
import 'package:stadia_app/styleguide/colors.dart';
import 'package:stadia_app/image_asset.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final logoHeight = screenHeight * 0.4;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          // background image
          Transform.translate(
            offset: Offset(screenWidth * 0.5, 10),
            child: Transform.rotate(
              angle: -0.1,
              child: SvgPicture.asset(
                logo,
                height: logoHeight,
                color: logoTintColor,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 60,
                ),
                // icons menu
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        child: Icon(
                          Icons.menu,
                          color: primaryTextColor,
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondaryHomePage()));
                        },
                      ),
                      Icon(
                        Icons.search,
                        color: primaryTextColor,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // avatar, name, ranking
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                        ),
                        child: Row(
                          children: <Widget>[
                            // the avatar and name
                            RoundedImageWidget(
                              imagePath: player1,
                              ranking: 39,
                              showRanking: true,
                              isOnline: true,
                              name: 'Batman',
                            ),
                            // text: Hello Jon Show
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Hello',
                                      style: userNameTextStyle,
                                    ),
                                    TextSpan(
                                      text: '\n',
                                    ),
                                    TextSpan(
                                      text: 'Jon Show',
                                      style: userNameTextStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // hours played
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 16.0,
                          bottom: 16,
                          top: 16,
                        ),
                        child: Material(
                          elevation: 4,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 16.0,
                                right: 16.0,
                                top: 16.0,
                                bottom: 32.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "HOURS PLAYED",
                                      style: hoursPlayedLabelTextStyle,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "297 Hours",
                                  style: hoursPlayedTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      // last played games
                      ContentHeadingWidget(
                        heading: 'Last played games',
                      ),
                      // list tile
                      for (var i = 0; i < lastPlayedGames.length; i++)
                        LastPlayedGameTile(
                          lastPlayedGame: lastPlayedGames[i],
                          screenWidth: screenWidth,
                        ),
                      ContentHeadingWidget(
                        heading: 'Friends',
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 12.0,
                      right: 12.0,
                      top: 2.0,
                      bottom: 10.0,
                    ),
                    child: Row(
                      children: <Widget>[
                        for (var i = 0; i < friends.length; i++)
                          RoundedImageWidget(
                            imagePath: friends[i].imagePath,
                            isOnline: friends[i].isOnline,
                            name: friends[i].name,
                            ranking: 0,
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
