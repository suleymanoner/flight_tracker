import 'package:flight_tracker/themes/app_theme.dart';
import 'package:flight_tracker/utils/constants.dart';
import 'package:flutter/material.dart';

class FlightDetailCard extends StatelessWidget {
  const FlightDetailCard({
    super.key,
    required this.airlineName,
    required this.flightNumber,
    required this.flightStatus,
    required this.flightDate,
  });

  final String airlineName;
  final String flightNumber;
  final String flightStatus;
  final String flightDate;

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
          children: [
            ListTile(
              title: Text(
                'Airline',
                style: AppTheme().textTheme.bodySmall!.copyWith(
                      fontSize: 16,
                    ),
              ),
              subtitle: Text(
                airlineName.isNotEmpty ? airlineName : 'No Data',
                style: AppTheme().textTheme.bodySmall!.copyWith(
                      fontSize: 18,
                    ),
              ),
            ),
            ListTile(
              title: Text(
                'Flight Number',
                style: AppTheme().textTheme.bodySmall!.copyWith(
                      fontSize: 16,
                    ),
              ),
              subtitle: Text(
                flightNumber.isNotEmpty ? flightNumber : 'No Data',
                style: AppTheme().textTheme.bodySmall!.copyWith(
                      fontSize: 18,
                    ),
              ),
            ),
            ListTile(
              title: Text(
                'Status',
                style: AppTheme().textTheme.bodySmall!.copyWith(
                      fontSize: 16,
                    ),
              ),
              subtitle: Text(
                flightStatus.isNotEmpty
                    ? Constants.capitalizeFirstLetter(flightStatus)
                    : 'No Data',
                style: AppTheme().textTheme.bodySmall!.copyWith(
                      fontSize: 18,
                    ),
              ),
            ),
            ListTile(
              title: Text(
                'Date',
                style: AppTheme().textTheme.bodySmall!.copyWith(
                      fontSize: 16,
                    ),
              ),
              subtitle: Text(
                flightDate.isNotEmpty ? flightDate : 'No Data',
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
