import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../models/weather_model.dart';

/// Displays a responsive grid of weather metric cards (humidity, wind, UV, sunrise, etc.).
class WeatherDetails extends StatelessWidget {
  final WeatherModel weather;

  const WeatherDetails({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Row(
          children: [
            const Icon(
              Icons.grid_view_rounded,
              size: 18,
              color: AppColors.primaryBlue,
            ),
            const SizedBox(width: 8),
            Text(
              'Weather Details',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),

        // Responsive 2-column Grid of Detail Cards
        LayoutBuilder(
          builder: (context, constraints) {
            final cardWidth = (constraints.maxWidth - 12) / 2;
            // Target height around 130px for balanced proportions across all screens
            final aspectRatio = (cardWidth / 130).clamp(0.85, 1.25);

            return GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: aspectRatio,
              children: [
                _buildDetailCard(
                  context,
                  label: 'HUMIDITY',
                  value: '${weather.humidity}%',
                  subtext: 'The dew point is 12°',
                  icon: Icons.water_drop_rounded,
                  iconColor: AppColors.rainBlue,
                ),
                _buildDetailCard(
                  context,
                  label: 'WIND',
                  value: '${weather.windSpeed} km/h',
                  subtext: '${weather.windDirection} · Gentle breeze',
                  icon: Icons.air_rounded,
                  iconColor: AppColors.accentCyan,
                ),
                _buildDetailCard(
                  context,
                  label: 'UV INDEX',
                  value: '${weather.uvIndex}',
                  subtext: _getUvDescription(weather.uvIndex),
                  icon: Icons.wb_sunny_rounded,
                  iconColor: AppColors.sunAmber,
                ),
                _buildDetailCard(
                  context,
                  label: 'PRESSURE',
                  value: '${weather.pressure} hPa',
                  subtext: 'Normal atmospheric',
                  icon: Icons.speed_rounded,
                  iconColor: AppColors.accentIndigo,
                ),
                _buildDetailCard(
                  context,
                  label: 'VISIBILITY',
                  value: '${weather.visibility} km',
                  subtext: 'Clear visibility',
                  icon: Icons.visibility_rounded,
                  iconColor: AppColors.primaryBlue,
                ),
                _buildDetailCard(
                  context,
                  label: 'RAIN CHANCE',
                  value: '${weather.precipitationProbability}%',
                  subtext: 'Low probability today',
                  icon: Icons.umbrella_rounded,
                  iconColor: AppColors.accentPurple,
                ),
                _buildDetailCard(
                  context,
                  label: 'SUNRISE',
                  value: weather.sunrise,
                  subtext: 'Dawn light',
                  icon: Icons.wb_twilight_rounded,
                  iconColor: AppColors.sunAmber,
                ),
                _buildDetailCard(
                  context,
                  label: 'SUNSET',
                  value: weather.sunset,
                  subtext: 'Dusk arrival',
                  icon: Icons.nights_stay_rounded,
                  iconColor: AppColors.accentPurple,
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildDetailCard(
    BuildContext context, {
    required String label,
    required String value,
    required String subtext,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.cardSurface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.glassBorder, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Header: Icon + Metric Label
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, size: 15, color: iconColor),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                    color: AppColors.textSecondary,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),

          // Value
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ),

          // Subtext / description
          Text(
            subtext,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              color: AppColors.textTertiary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  String _getUvDescription(int uv) {
    if (uv <= 2) return 'Low';
    if (uv <= 5) return 'Moderate';
    if (uv <= 7) return 'High';
    if (uv <= 10) return 'Very High';
    return 'Extreme';
  }
}
