import 'package:flutter/material.dart';
import 'package:srl/extensions/adapters.dart';
import 'package:srl/extensions/color.dart';
import 'package:srl/extensions/date_time.dart';
import 'package:srl/extensions/string.dart';
import 'package:srl/extensions/num.dart';
import 'package:srl/services/open_weather/endpoints/onecall.dart';
import 'package:srl/widgets/animated_icon.dart';

/// Displays the hourly weather in a horizontal page view
/// with opacity and size transitions based on scroll position.
class HourlyWeather extends StatefulWidget {
  final OpenWeatherOneCall oneCall;

  const HourlyWeather({
    Key key,
    @required this.oneCall,
  }) : super(key: key);

  @override
  _HourlyWeatherState createState() => _HourlyWeatherState();
}

class _HourlyWeatherState extends State<HourlyWeather> {
  PageController _controller;
  double _currentPage = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 1 / 4);
    _controller.addListener(() {
      setState(() => _currentPage = _controller.page);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children: [
        for (var hourlyData in widget.oneCall.hourly)
          Builder(
            builder: (BuildContext context) {
              final pageIndex = widget.oneCall.hourly.indexOf(hourlyData);
              final transition = _currentPage.pageTransition(pageIndex);
              final curve = Curves.easeInOut;

              return Column(
                children: [
                  SizedBox(height: 16),

                  /// Description
                  Opacity(
                    opacity: transition.visibility,
                    child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      child: Text(
                        hourlyData.weather.description.toCapitalized(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white.opacity700,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.3,
                          fontFamily: "", // Use default system font
                        ),
                      ),
                    ),
                  ),

                  /// Weather icon
                  Expanded(
                    flex: 2,
                    child: Opacity(
                      opacity: 0.25 + transition.visibility * 0.75,
                      child: SRLAnimatedIcon(
                        type: hourlyData.weather.icon.asAnimatedIcon,
                        dimension: 100 -
                            25.0 * curve.transform(transition.invisibility),
                      ),
                    ),
                  ),

                  Opacity(
                    opacity: 0.25 + transition.visibility * 0.75,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        /// Time
                        Text(
                          hourlyData.dt.ashhmm,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white.opacity900,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.3,
                          ),
                        ),

                        /// Temp
                        Text(
                          '${hourlyData.temp.asFahrenheit.round()}°',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white.opacity700,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 8),
                ],
              );
            },
          ),
      ],
    );
  }
}
