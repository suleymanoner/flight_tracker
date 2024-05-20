import 'package:flight_tracker/models/flight_response.dart';
import 'package:flight_tracker/themes/app_theme.dart';
import 'package:flight_tracker/widgets/dep_and_arr_card.dart';
import 'package:flight_tracker/widgets/flight_detail_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.flightData});

  final FlightData flightData;

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('yMMMMEEEEd').format(DateTime.parse(flightData.flightDate));

    String depScheduled =
        DateFormat.Hm().format(DateTime.parse(flightData.departure.scheduled));

    String depEstimated =
        DateFormat.Hm().format(DateTime.parse(flightData.departure.estimated));

    String arrScheduled =
        DateFormat.Hm().format(DateTime.parse(flightData.arrival.scheduled));

    String arrEstimated =
        DateFormat.Hm().format(DateTime.parse(flightData.arrival.estimated));

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Text(
                    'Flight Details',
                    style: AppTheme().textTheme.titleLarge!.copyWith(
                          fontSize: 26,
                        ),
                  ),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 20),
            FlightDetailCard(
              airlineName: flightData.airline.name,
              flightDate: formattedDate,
              flightNumber: flightData.flight.iata,
              flightStatus: flightData.flightStatus,
            ),
            const SizedBox(height: 20),
            DepAndArrCard(
              airport: flightData.departure.airport,
              estimated: depEstimated,
              scheduled: depScheduled,
              timezone: flightData.departure.timezone,
              title: 'Departure',
              isDep: true,
            ),
            const SizedBox(height: 20),
            DepAndArrCard(
              airport: flightData.arrival.airport,
              estimated: arrEstimated,
              scheduled: arrScheduled,
              timezone: flightData.arrival.timezone,
              title: 'Arrival',
              isDep: false,
            ),
          ],
        ),
      ),
    );
  }
}
