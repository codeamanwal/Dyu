// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:testing/weather/weather%20Model.dart';
// import 'package:testing/weather/weatherProvider.dart';
//
// class InfoCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//
//     // Fetch weather data when the widget is built
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       Provider.of<WeatherProvider>(context, listen: false).fetchWeatherByLocation();
//     });
//
//     return SizedBox(
//       height: 300,
//       width: size.width,
//       child: Stack(
//         alignment: Alignment.bottomCenter,
//         children: [
//           Container(
//             height: 240,
//             margin: const EdgeInsets.only(bottom: 30),
//             width: size.width,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 gradient: LinearGradient(
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                     colors: [
//                       Colors.white.withOpacity(0.3),
//                       Colors.white.withOpacity(0.3),
//                       Colors.white.withOpacity(0.3),
//                     ])),
//           ),
//           Positioned(
//               top: -10,
//               left: 10,
//               child: Consumer<WeatherProvider>(
//                 builder: (context, weatherProvider, child) {
//                   if (weatherProvider.loading) {
//                     return CircularProgressIndicator();
//                   }
//                   if (weatherProvider.weather == null) {
//                     return Text('Failed to load weather data');
//                   }
//                   return Image.asset(
//                   "",//  weatherProvider.weather!.imagePath,
//                     height: 150,
//                     width: 170,
//                     fit: BoxFit.fill,
//                   );
//                 },
//               )),
//           Positioned(
//             bottom: 50,
//             left: 20,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Consumer<WeatherProvider>(
//                   builder: (context, weatherProvider, child) {
//                     if (weatherProvider.loading) {
//                       return CircularProgressIndicator();
//                     }
//                     if (weatherProvider.weather == null) {
//                       return Text('Failed to load weather data');
//                     }
//                     return Text(
//                       'Feel like ${weatherProvider.weather!.cityName}',
//                       style: const TextStyle(
//                           height: 0,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold),
//                     );
//                   },
//                 ),
//                 Consumer<WeatherProvider>(
//                   builder: (context, weatherProvider, child) {
//                     if (weatherProvider.loading) {
//                       return CircularProgressIndicator();
//                     }
//                     if (weatherProvider.weather == null) {
//                       return Text('Failed to load weather data');
//                     }
//                     return Text(
//                       'Humidity: ${weatherProvider.weather!.humidity}',
//                       style: const TextStyle(
//                           height: 0,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold),
//                     );
//                   },
//                 ),
//                 Consumer<WeatherProvider>(
//                   builder: (context, weatherProvider, child) {
//                     if (weatherProvider.loading) {
//                       return CircularProgressIndicator();
//                     }
//                     if (weatherProvider.weather == null) {
//                       return Text('Failed to load weather data');
//                     }
//                     return Text(
//                       'Wind: ${weatherProvider.weather!.windSpeed}',
//                       style: const TextStyle(
//                           height: 0,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold),
//                     );
//                   },
//                 ),
//                 Consumer<WeatherProvider>(
//                   builder: (context, weatherProvider, child) {
//                     if (weatherProvider.loading) {
//                       return CircularProgressIndicator();
//                     }
//                     if (weatherProvider.weather == null) {
//                       return Text('Failed to load weather data');
//                     }
//                     return Text(
//                       'Precipitation: ${weatherProvider.weather!.precipitation}',
//                       style: const TextStyle(
//                           height: 0,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold),
//                     );
//                   },
//                 ),
//                 // Consumer<WeatherProvider>(
//                 //   builder: (context, weatherProvider, child) {
//                 //     if (weatherProvider.loading) {
//                 //       return CircularProgressIndicator();
//                 //     }
//                 //     if (weatherProvider.weather == null) {
//                 //       return Text('Failed to load weather data');
//                 //     }
//                 //     return Text(
//                 //       weatherProvider.weather!.weatherDescription,
//                 //       style: const TextStyle(
//                 //           height: 0,
//                 //           color: Colors.white,
//                 //           fontWeight: FontWeight.bold,
//                 //           fontSize: 23),
//                 //     );
//                 //   },
//                 // ),
//                 const SizedBox(height: 5,),
//               ],
//             ),
//           ),
//           Positioned(
//             top: 40,
//             right: 50,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 ShaderMask(
//                   shaderCallback: (Rect bounds) {
//                     return LinearGradient(
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                       colors: [
//                         Colors.white,
//                         Colors.white.withOpacity(.1)
//                       ],
//                     ).createShader(bounds);
//                   },
//                   child: Consumer<WeatherProvider>(
//                     builder: (context, weatherProvider, child) {
//                       if (weatherProvider.loading) {
//                         return CircularProgressIndicator();
//                       }
//                       if (weatherProvider.weather == null) {
//                         return Text('Failed to load weather data');
//                       }
//                       return Text(
//                         weatherProvider.weather!.temperature.toString(),
//                         style: const TextStyle(
//                           fontSize: 40,
//                           height: 0,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:mqtt_controller/screens/weather/weatherProvider.dart';
import 'package:provider/provider.dart';


class InfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    // Fetch weather data when the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<WeatherProvider>(context, listen: false).fetchWeatherByLocation();
    });

    return SizedBox(
      height: 200,
      width: size.width,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 240,
            margin: const EdgeInsets.only(bottom: 30),
            width: size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(0.1),
                      Colors.white.withOpacity(0.1),
                      Colors.white.withOpacity(0.1),
                    ])),
          ),
          Positioned(
            top: 10,
            left: 0,
            child: Consumer<WeatherProvider>(
              builder: (context, weatherProvider, child) {
                if (weatherProvider.loading) {
                  return CircularProgressIndicator();
                }
                if (weatherProvider.weather == null) {
                  return Text('Failed to load weather data');
                }
                return Image.asset(
                  "assets/images/cloudly.png", //  weatherProvider.weather!.imagePath,
                  height: 120,
                  width: 100,
                  fit: BoxFit.fill,
                );
              },
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height/6,
              left: 100,
              child: Column(children: [
            Consumer<WeatherProvider>(
              builder: (context, weatherProvider, child) {
                if (weatherProvider.loading) {
                  return CircularProgressIndicator();
                }
                if (weatherProvider.weather == null) {
                  return Text('Failed to load weather data');
                }
                return Text(
                  // '${weatherProvider.weather!.weatherDescription}',
                  'Mostly Cloudy',
                  style: const TextStyle(
                      height: 1.5,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                );
              },
            ),

            Consumer<WeatherProvider>(
              builder: (context, weatherProvider, child) {
                if (weatherProvider.loading) {
                  return CircularProgressIndicator();
                }
                if (weatherProvider.weather == null) {
                  return Text('Failed to load weather data');
                }
                return Text(
                  '${weatherProvider.weather!.cityName},India ',
                  style: const TextStyle(
                      height: 1.5,
                      color: Colors.white,
                      fontSize: 18),
                );
              },
            ),
          ],)),

          Positioned(
            bottom: MediaQuery.of(context).size.height/15,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
              Consumer<WeatherProvider>(
                builder: (context, weatherProvider, child) {
                  if (weatherProvider.loading) {
                    return CircularProgressIndicator();
                  }
                  if (weatherProvider.weather == null) {
                    return Text('Failed to load weather data');
                  }
                  return Column(
                    children: [
                      Text(
                        '${weatherProvider.weather!.feelsLike}°C',
                        style: const TextStyle(
                            height: 1.5,
                            color: Colors.white,
                            fontSize: 15),
                      ),
                      Text(
                        'Sensible',
                        style: const TextStyle(
                            height: 1.5,
                            color: Colors.white,
                            fontSize: 12),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(width: 15,),
              Consumer<WeatherProvider>(
                builder: (context, weatherProvider, child) {
                  if (weatherProvider.loading) {
                    return CircularProgressIndicator();
                  }
                  if (weatherProvider.weather == null) {
                    return Text('Failed to load weather data');
                  }
                  return Column(
                    children: [
                      Text(
                        '${weatherProvider.weather!.precipitation}%',
                        style: const TextStyle(
                            height: 1.5,
                            color: Colors.white,
                            fontSize: 15),
                      ),
                      Text(
                        'Precipitation',
                        style: const TextStyle(
                            height: 1.5,
                            color: Colors.white,
                            fontSize: 12),
                      ),
                    ],
                  );
                },
              ),
                SizedBox(width: 15,),
              Consumer<WeatherProvider>(
                builder: (context, weatherProvider, child) {
                  if (weatherProvider.loading) {
                    return CircularProgressIndicator();
                  }
                  if (weatherProvider.weather == null) {
                    return Text('Failed to load weather data');
                  }
                  return Column(
                    children: [
                      Text(
                        '${weatherProvider.weather!.humidity}%',
                        style: const TextStyle(
                            height: 1.5,
                            color: Colors.white,
                            fontSize: 15),
                      ),
                      Text(
                        'Humidity',
                        style: const TextStyle(
                            height: 1.5,
                            color: Colors.white,
                            fontSize: 12),
                      ),
                    ],
                  );
                },
              ),
                SizedBox(width: 15,),
              Consumer<WeatherProvider>(
                builder: (context, weatherProvider, child) {
                  if (weatherProvider.loading) {
                    return CircularProgressIndicator();
                  }
                  if (weatherProvider.weather == null) {
                    return Text('Failed to load weather data');
                  }
                  return Column(
                    children: [
                      Text(
                        ' ${weatherProvider.weather!.windSpeed} km/h',
                        style: const TextStyle(
                            height: 1.5,
                            color: Colors.white,
                            fontSize: 15),
                      ),
                      Text(
                        'Wind',
                        style: const TextStyle(
                            height: 1.5,
                            color: Colors.white,
                            fontSize: 12),
                      ),
                    ],
                  );
                },
              ),
            ],),
                const SizedBox(height: 5),
              ],
            ),
          ),
          Positioned(
            top: 40,
            right: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white,
                        Colors.white.withOpacity(.1)
                      ],
                    ).createShader(bounds);
                  },
                  child: Consumer<WeatherProvider>(
                    builder: (context, weatherProvider, child) {
                      if (weatherProvider.loading) {
                        return CircularProgressIndicator();
                      }
                      if (weatherProvider.weather == null) {
                        return Text('Failed to load weather data');
                      }
                      return Text(
                        '${weatherProvider.weather!.temperature}°',
                        style: const TextStyle(
                          fontSize: 30,
                          height: 0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      );
                    },
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