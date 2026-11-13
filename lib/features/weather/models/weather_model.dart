/// Represents a single forecast interval in the hourly timeline.
///
/// Pure Dart model independent of UI widgets.
class HourlyForecastItem {
  final String time;
  final int temperature;
  final String condition;
  final int weatherCode;
  final bool isNow;

  const HourlyForecastItem({
    required this.time,
    required this.temperature,
    required this.condition,
    required this.weatherCode,
    this.isNow = false,
  });
}

/// Represents the complete weather state for a location.
///
/// Designed as a pure Dart model with zero Flutter UI dependencies,
/// ensuring strict separation between data and presentation layers.
class WeatherModel {
  // Location
  final String cityName;
  final String country;

  // Primary Temperature & Condition
  final int temperature;
  final int feelsLike;
  final int tempMax;
  final int tempMin;
  final String condition;
  final String conditionDescription;
  final int weatherCode; // Standard WMO weather code (aligned with Open-Meteo)
  final bool isDay;

  // Atmospheric Metrics
  final int humidity; // in %
  final double windSpeed; // in km/h
  final String windDirection; // e.g. "NW"
  final int pressure; // in hPa
  final double visibility; // in km
  final int uvIndex; // 0 - 11+
  final int precipitationProbability; // in %

  // Astronomical Timings
  final String sunrise; // e.g. "06:48 AM"
  final String sunset; // e.g. "05:12 PM"

  // Hourly Predictions
  final List<HourlyForecastItem> hourlyForecast;

  const WeatherModel({
    required this.cityName,
    required this.country,
    required this.temperature,
    required this.feelsLike,
    required this.tempMax,
    required this.tempMin,
    required this.condition,
    required this.conditionDescription,
    required this.weatherCode,
    required this.isDay,
    required this.humidity,
    required this.windSpeed,
    required this.windDirection,
    required this.pressure,
    required this.visibility,
    required this.uvIndex,
    required this.precipitationProbability,
    required this.sunrise,
    required this.sunset,
    required this.hourlyForecast,
  });

  /// Realistic mock dataset for Phase 1 development and previewing.
  static WeatherModel get mock => const WeatherModel(
    cityName: 'San Francisco',
    country: 'United States',
    temperature: 19,
    feelsLike: 18,
    tempMax: 22,
    tempMin: 14,
    condition: 'Partly Cloudy',
    conditionDescription: 'Scattered clouds with cool afternoon breeze',
    weatherCode: 2, // WMO 2: Partly cloudy
    isDay: true,
    humidity: 68,
    windSpeed: 14.5,
    windDirection: 'NW',
    pressure: 1016,
    visibility: 10.0,
    uvIndex: 4,
    precipitationProbability: 15,
    sunrise: '06:48 AM',
    sunset: '05:12 PM',
    hourlyForecast: [
      HourlyForecastItem(
        time: 'Now',
        temperature: 19,
        condition: 'Partly Cloudy',
        weatherCode: 2,
        isNow: true,
      ),
      HourlyForecastItem(
        time: '1 PM',
        temperature: 20,
        condition: 'Sunny',
        weatherCode: 0,
      ),
      HourlyForecastItem(
        time: '2 PM',
        temperature: 22,
        condition: 'Sunny',
        weatherCode: 0,
      ),
      HourlyForecastItem(
        time: '3 PM',
        temperature: 21,
        condition: 'Partly Cloudy',
        weatherCode: 2,
      ),
      HourlyForecastItem(
        time: '4 PM',
        temperature: 19,
        condition: 'Cloudy',
        weatherCode: 3,
      ),
      HourlyForecastItem(
        time: '5 PM',
        temperature: 18,
        condition: 'Light Rain',
        weatherCode: 61,
      ),
      HourlyForecastItem(
        time: '6 PM',
        temperature: 17,
        condition: 'Showers',
        weatherCode: 80,
      ),
      HourlyForecastItem(
        time: '7 PM',
        temperature: 16,
        condition: 'Clear Night',
        weatherCode: 0,
      ),
    ],
  );
}
