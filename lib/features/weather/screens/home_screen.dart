import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../models/weather_model.dart';
import '../widgets/current_weather_card.dart';
import '../widgets/hourly_forecast.dart';
import '../widgets/weather_details.dart';

/// Main weather dashboard screen assembling the hero weather card,
/// hourly forecast timeline, and atmospheric detail grid.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Phase 1 utilizes the centralized mock weather dataset
    final weather = WeatherModel.mock;

    return Scaffold(
      body: Stack(
        children: [
          // 1. Premium Ambient Gradient Background
          Container(
            decoration: const BoxDecoration(
              gradient: AppColors.backgroundGradient,
            ),
          ),

          // 2. Subtle decorative atmospheric glow orbs
          Positioned(
            top: -60,
            right: -60,
            child: Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.accentPurple.withValues(alpha: 0.12),
              ),
            ),
          ),
          Positioned(
            top: 240,
            left: -80,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryBlue.withValues(alpha: 0.08),
              ),
            ),
          ),

          // 3. Main Dashboard Content inside SafeArea
          SafeArea(
            child: Column(
              children: [
                // Top Custom Header
                _buildHeader(context, weather),

                // Vertically scrollable dashboard body
                Expanded(
                  child: Center(
                    child: ConstrainedBox(
                      // Keeps layout elegant and centered on larger screens / tablets
                      constraints: const BoxConstraints(maxWidth: 640),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Hero Current Weather Card
                            CurrentWeatherCard(weather: weather),

                            const SizedBox(height: 24),

                            // Hourly Forecast Horizontal Section
                            HourlyForecast(items: weather.hourlyForecast),

                            const SizedBox(height: 24),

                            // Atmospheric Details Grid (8 metrics)
                            WeatherDetails(weather: weather),

                            const SizedBox(height: 28),

                            // Footer Status Indicator
                            Center(
                              child: Text(
                                'Updated just now • Clima Phase 1 Mock Data',
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(
                                      color: const Color.fromARGB(255, 254, 0, 0),
                                      fontSize: 12,
                                    ),
                              ),
                            ),

                            const SizedBox(height: 32),
                          ],
                        ),
                      ),
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

  Widget _buildHeader(BuildContext context, WeatherModel weather) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Branding & Active Location Pill
          Expanded(
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.cardSurface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.glassBorder),
                  ),
                  child: const Icon(
                    Icons.cloud_outlined,
                    size: 20,
                    color: AppColors.primaryBlue,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'CLIMA',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 2.0,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Text(
                        '${weather.cityName}, ${weather.country}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textSecondary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),

          // Actions
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('City search will be enabled in Phase 2'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            icon: const Icon(Icons.search_rounded),
            color: AppColors.textPrimary,
            tooltip: 'Search City',
          ),
        ],
      ),
    );
  }
}
