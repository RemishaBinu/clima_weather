import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../models/weather_model.dart';

/// Displays a horizontally scrollable list of hourly weather predictions.
class HourlyForecast extends StatelessWidget {
  final List<HourlyForecastItem> items;

  const HourlyForecast({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  const Icon(
                    Icons.schedule_rounded,
                    size: 18,
                    color: AppColors.primaryBlue,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Hourly Forecast',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                            letterSpacing: 0.3,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'Next 24 Hours',
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary),
            ),
          ],
        ),
        const SizedBox(height: 14),

        // Horizontal List
        SizedBox(
          height: 136,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: items.length,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final item = items[index];
              return _buildHourlyItem(context, item);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildHourlyItem(BuildContext context, HourlyForecastItem item) {
    final isNow = item.isNow;

    return Container(
      width: 78,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
      decoration: BoxDecoration(
        color: isNow ? AppColors.cardSurfaceLight : AppColors.cardSurface,
        gradient: isNow
            ? const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF2A3655), Color(0xFF1E2843)],
              )
            : null,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isNow ? AppColors.primaryBlue : AppColors.glassBorder,
          width: isNow ? 1.5 : 1,
        ),
        boxShadow: isNow
            ? [
                BoxShadow(
                  color: AppColors.primaryBlue.withValues(alpha: 0.25),
                  blurRadius: 14,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Time
          Text(
            item.time,
            style: TextStyle(
              fontSize: 13,
              fontWeight: isNow ? FontWeight.w700 : FontWeight.w500,
              color: isNow ? AppColors.primaryBlue : AppColors.textSecondary,
            ),
          ),

          // Weather Icon
          Icon(
            _getWeatherIcon(item.condition),
            size: 28,
            color: _getWeatherIconColor(item.condition),
          ),

          // Temperature
          Text(
            '${item.temperature}°',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getWeatherIcon(String condition) {
    final lower = condition.toLowerCase();
    if (lower.contains('sun') || lower.contains('clear')) {
      return Icons.wb_sunny_rounded;
    } else if (lower.contains('partly')) {
      return Icons.cloud_queue_rounded;
    } else if (lower.contains('rain') || lower.contains('shower')) {
      return Icons.grain_rounded;
    } else if (lower.contains('thunder')) {
      return Icons.thunderstorm_rounded;
    } else if (lower.contains('snow')) {
      return Icons.ac_unit_rounded;
    }
    return Icons.cloud_rounded;
  }

  Color _getWeatherIconColor(String condition) {
    final lower = condition.toLowerCase();
    if (lower.contains('sun') || lower.contains('clear')) {
      return AppColors.sunAmber;
    } else if (lower.contains('rain') || lower.contains('shower')) {
      return AppColors.rainBlue;
    } else if (lower.contains('snow')) {
      return AppColors.snowWhite;
    }
    return AppColors.primaryBlue;
  }
}
