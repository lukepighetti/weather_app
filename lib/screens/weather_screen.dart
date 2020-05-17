import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:srl/extensions/color.dart';
import 'package:srl/extensions/num.dart';
import 'package:srl/extensions/open_weather_hourly_point.dart';
import 'package:srl/extensions/string.dart';
import 'package:srl/models/position.dart';
import 'package:srl/services/open_weather/models/all_weather_data.dart';
import 'package:srl/services/open_weather/open_weather.dart';
import 'package:srl/widgets/animated_icon.dart';
import 'package:srl/widgets/dot_indicator.dart';
import 'package:srl/widgets/srl_icons.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

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
        bottom: false,
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
                          SizedBox(height: 2),

                          /// Weather description, ie `Scattered Snow`
                          Text(
                            '${weatherCall.current.weather.description.toCapitalized()}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).primaryColor.opacity200,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.3,
                              fontFamily: "", // Use default system font
                            ),
                          ),
                          SizedBox(height: 12),

                          /// Page indicator
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                SRLIcons.locations_filled,
                                color: Theme.of(context).primaryColor,
                                size: 18,
                              ),
                              for (var _ in [1, 2])
                                DotIndicator(
                                  color:
                                      Theme.of(context).primaryColor.opacity200,
                                ),
                            ],
                          ),
                        ],
                      ),

                      /// Weather icon
                      SRLAnimatedIcon(
                        type: AnimatedIconType.snow,
                        dimension: 196,
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
                                  fontSize: 84,
                                  fontWeight: FontWeight.normal,
                                  height: 1.0,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),

                              /// Degree symbol, artisinally positioned
                              Positioned(
                                right: -30,
                                child: Text(
                                  '°',
                                  style: TextStyle(
                                    fontSize: 84,
                                    height: 1.0,
                                    fontWeight: FontWeight.normal,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              )
                            ],
                          ),

                          /// Max/min temp, ie `24/8`
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(999),
                              color: Theme.of(context).primaryColor.opacity50,
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 12,
                            ),
                            child: Text(
                              "${weatherCall.hourly.maxTemp.asFahrenheit.round()}/${weatherCall.hourly.minTemp.asFahrenheit.round()}",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                                color:
                                    Theme.of(context).primaryColor.opacity200,
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
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(36),
                        topRight: Radius.circular(36),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: -20,
                          blurRadius: 24,
                        ),
                      ],
                    ),
                    child: SafeArea(
                      bottom: true,
                      minimum: const EdgeInsets.only(bottom: 8.0),
                      child: Column(
                        children: [
                          Spacer(),
                          Padding(
                            /// Bottom padding is handled by SafeArea.minimum
                            padding: const EdgeInsets.all(8.0) -
                                const EdgeInsets.only(bottom: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                              padding: EdgeInsets.all(10),
                              child: GNav(
                                gap: 8,
                                iconSize: 28,
                                activeColor: Theme.of(context).primaryColor,
                                color: Theme.of(context).primaryColor,
                                tabBackgroundColor:
                                    Theme.of(context).primaryColor.opacity100,
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
                                    icon: SRLIcons.forecast_alt,
                                    text: 'Forecast'.toUpperCase(),
                                  ),
                                  GButton(
                                    icon: SRLIcons.radar,
                                    text: 'Radar'.toUpperCase(),
                                  ),
                                  GButton(
                                    icon: SRLIcons.locations,
                                    text: 'Locations'.toUpperCase(),
                                  ),
                                  GButton(
                                    icon: SRLIcons.settings,
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
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
