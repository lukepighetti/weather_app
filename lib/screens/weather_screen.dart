import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:srl/extensions/num.dart';
import 'package:srl/extensions/string.dart';
import 'package:srl/models/position.dart';
import 'package:srl/services/open_weather/models/all_weather_data.dart';
import 'package:srl/services/open_weather/open_weather.dart';
import 'package:srl/widgets/animated_icon.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WhenRebuilder<AllWeatherData>(
          observe: () => RM.future(
              IN.get<OpenWeather>().getAllWeatherData(Position.baltimore())),
          onIdle: () => Center(child: Text("We're waiting for the weather!")),
          onWaiting: () => Center(child: CircularProgressIndicator()),
          onError: (error) => Center(child: Text("$error")),
          onData: (allWeather) {
            final weatherCall = allWeather.oneCall;
            final locationName = allWeather.currentWeather.name;

            if (weatherCall == null) return SizedBox.shrink();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                /// Main content
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      /// Header
                      Column(
                        children: [
                          /// Location name, ie `New York`
                          Text(
                            "$locationName".toUpperCase(),
                            style: TextStyle(
                              fontSize: 28,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),

                          /// Weather description, ie `Scattered Snow`
                          Text(
                            '${weatherCall.current.weather.description.toCapitalized()}',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade500,
                            ),
                          ),
                          SizedBox(height: 4),

                          /// Location status?
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                MdiIcons.nearMe,
                                color: Theme.of(context).primaryColor,
                                size: 12,
                              ),
                            ],
                          ),
                        ],
                      ),

                      /// Weather icon
                      SRLAnimatedIcon(
                        type: AnimatedIconType.snow,
                        dimension: 150,
                      ),

                      /// Temperature & wind speed
                      Column(
                        children: [
                          /// Temperature, ie `14°`
                          Stack(
                            overflow: Overflow.visible,
                            children: [
                              Text(
                                '${weatherCall.current.temp.asFahrenheit.round()}',
                                style: TextStyle(
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),

                              /// Degree symbol, artisinally positioned
                              Positioned(
                                right: -16,
                                child: Text(
                                  '°',
                                  style: TextStyle(
                                    fontSize: 48,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              )
                            ],
                          ),

                          /// Wind speed, ie `5 mph`
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(999),
                              color: Colors.grey.shade100,
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 8,
                            ),
                            child: Text(
                              "${weatherCall.current.windSpeed.round()}mph",
                              style: TextStyle(
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                /// Bottom sheet / navigation
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(36),
                        topRight: Radius.circular(36),
                      ),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Column(
                      children: [
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            padding: EdgeInsets.all(8),
                            child: GNav(
                              gap: 8,
                              iconSize: 24,
                              activeColor: Theme.of(context).primaryColor,
                              color: Theme.of(context).primaryColor,
                              tabBackgroundColor: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(.05),
                              duration: Duration(milliseconds: 250),
                              curve: Curves.easeInOut,
                              textStyle: TextStyle(
                                fontSize: 13,
                                color: Theme.of(context).primaryColor,
                                letterSpacing: 1.0,
                                fontWeight: FontWeight.bold,
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              tabs: [
                                GButton(
                                  icon: MdiIcons.calendarOutline,
                                  text: 'Forecast'.toUpperCase(),
                                ),
                                GButton(
                                  icon: MdiIcons.radar,
                                  text: 'Radar'.toUpperCase(),
                                ),
                                GButton(
                                  icon: OMIcons.nearMe,
                                  text: 'Locations'.toUpperCase(),
                                ),
                                GButton(
                                  icon: MdiIcons.cogOutline,
                                  text: 'Settings'.toUpperCase(),
                                ),
                              ],
                              selectedIndex: _selectedIndex,
                              onTabChange: (index) {
                                setState(() => _selectedIndex = index);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
