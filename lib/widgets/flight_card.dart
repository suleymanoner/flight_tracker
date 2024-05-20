import 'package:flight_tracker/models/flight_response.dart';
import 'package:flight_tracker/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

DateTime now = DateTime.now();

class FlightCard extends StatelessWidget {
  final FlightData flightData;
  final void Function() onTapFlight;

  const FlightCard({
    super.key,
    required this.flightData,
    required this.onTapFlight,
  });

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.parse(flightData.flightDate);

    String formattedDate = DateFormat('MMMM d').format(date);

    return InkWell(
      onTap: onTapFlight,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10),
        elevation: 10,
        child: SizedBox(
          height: 65,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  flightData.flight.iata.isNotEmpty
                      ? flightData.flight.iata
                      : 'No Data',
                  style: AppTheme().textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Text(
                  flightData.departure.iata.isNotEmpty
                      ? flightData.departure.iata
                      : 'No Data',
                  style: AppTheme().textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Text(
                  flightData.arrival.iata.isNotEmpty
                      ? flightData.arrival.iata
                      : 'No Data',
                  style: AppTheme().textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Text(
                  formattedDate.isNotEmpty ? formattedDate : 'No Data',
                  style: AppTheme().textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Text(
                  flightData.airline.iata.isNotEmpty
                      ? flightData.airline.iata
                      : 'No Data',
                  style: AppTheme().textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
