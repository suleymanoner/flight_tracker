import 'package:flight_tracker/themes/app_theme.dart';
import 'package:flutter/material.dart';

class DepAndArrCard extends StatelessWidget {
  const DepAndArrCard({
    super.key,
    required this.title,
    required this.airport,
    required this.timezone,
    required this.scheduled,
    required this.estimated,
    required this.isDep,
  });

  final String title;
  final String airport;
  final String timezone;
  final String scheduled;
  final String estimated;
  final bool isDep;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: AppTheme().textTheme.titleLarge!.copyWith(
                        fontSize: 20,
                      ),
                ),
                const SizedBox(width: 10),
                Icon(
                  isDep ? Icons.flight_takeoff : Icons.flight_land,
                  color: kColorScheme.primary,
                ),
              ],
            ),
            const SizedBox(height: 10),
            ListTile(
              title: Text(
                'Airport',
                style: AppTheme().textTheme.bodySmall!.copyWith(
                      fontSize: 16,
                    ),
              ),
              subtitle: Text(
                airport.isNotEmpty ? airport : 'No Data',
                style: AppTheme().textTheme.bodySmall!.copyWith(
                      fontSize: 18,
                    ),
              ),
            ),
            ListTile(
              title: Text(
                'Timezone',
                style: AppTheme().textTheme.bodySmall!.copyWith(
                      fontSize: 16,
                    ),
              ),
              subtitle: Text(
                timezone.isNotEmpty ? timezone : 'No Data',
                style: AppTheme().textTheme.bodySmall!.copyWith(
                      fontSize: 18,
                    ),
              ),
            ),
            ListTile(
              title: Text(
                'Scheduled',
                style: AppTheme().textTheme.bodySmall!.copyWith(
                      fontSize: 16,
                    ),
              ),
              subtitle: Text(
                scheduled.isNotEmpty ? scheduled : 'No Data',
                style: AppTheme().textTheme.bodySmall!.copyWith(
                      fontSize: 18,
                    ),
              ),
            ),
            ListTile(
              title: Text(
                'Estimated',
                style: AppTheme().textTheme.bodySmall!.copyWith(
                      fontSize: 16,
                    ),
              ),
              subtitle: Text(
                estimated.isNotEmpty ? estimated : 'No Data',
                style: AppTheme().textTheme.bodySmall!.copyWith(
                      fontSize: 18,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
