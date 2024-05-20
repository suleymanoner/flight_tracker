import 'package:flight_tracker/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flight_tracker/models/flight_response.dart';

class ResultCard extends StatelessWidget {
  final FlightData flightData;
  final void Function() openDetails;

  const ResultCard({
    super.key,
    required this.flightData,
    required this.openDetails,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: openDetails,
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Flight ${flightData.flight.iata}',
                    style: AppTheme().textTheme.titleLarge,
                  ),
                  Text(
                    'Date: ${flightData.flightDate}',
                    style: AppTheme().textTheme.titleLarge,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.flight_takeoff),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Departure: ${flightData.departure.airport}',
                      style: AppTheme().textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.flight_land),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Arrival: ${flightData.arrival.airport}',
                      style: AppTheme().textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
