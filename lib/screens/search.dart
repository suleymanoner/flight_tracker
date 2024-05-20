import 'package:flight_tracker/models/flight_response.dart';
import 'package:flight_tracker/screens/detail.dart';
import 'package:flight_tracker/services/api_service.dart';
import 'package:flight_tracker/utils/constants.dart';
import 'package:flight_tracker/widgets/result_card.dart';
import 'package:flight_tracker/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class SearchFlightsScreen extends StatefulWidget {
  const SearchFlightsScreen({super.key});

  @override
  _SearchFlightsScreenState createState() => _SearchFlightsScreenState();
}

class _SearchFlightsScreenState extends State<SearchFlightsScreen> {
  final TextEditingController flightNumberController = TextEditingController();
  final TextEditingController airlineIataController = TextEditingController();
  final TextEditingController depIataController = TextEditingController();
  final TextEditingController arrIataController = TextEditingController();
  final TextEditingController flightDateController = TextEditingController();

  List<FlightData> _filteredFlights = [];

  void _searchFlights() {
    String? flightNumber = flightNumberController.text.isNotEmpty
        ? flightNumberController.text
        : null;
    String? airlineIata = airlineIataController.text.isNotEmpty
        ? airlineIataController.text
        : null;
    String? depIata =
        depIataController.text.isNotEmpty ? depIataController.text : null;
    String? arrIata =
        arrIataController.text.isNotEmpty ? arrIataController.text : null;
    String? flightDate =
        flightDateController.text.isNotEmpty ? flightDateController.text : null;

    if (flightNumber == null &&
        airlineIata == null &&
        depIata == null &&
        arrIata == null &&
        flightDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter at least one search criterion!'),
        ),
      );
    } else {
      setState(() {
        _filteredFlights = ApiService.searchFlightsLocally(
          flights:
              FlightResponse.fromJson(Constants.EXAMPLE_RESPONSE_JSON).data,
          flightNumber: flightNumber,
          airlineIata: airlineIata,
          depIata: depIata,
          arrIata: arrIata,
          flightDate: flightDate,
        );
      });
    }
  }

  void _openDetails(FlightData flightData) {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (ctx) => DetailScreen(
        flightData: flightData,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Flights'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomTextField(
                controller: flightNumberController,
                label: 'Flight Number',
                icon: Icons.flight,
              ),
              CustomTextField(
                controller: airlineIataController,
                label: 'Airline IATA',
                icon: Icons.airlines,
              ),
              CustomTextField(
                controller: depIataController,
                label: 'Departure IATA',
                icon: Icons.flight_takeoff,
              ),
              CustomTextField(
                controller: arrIataController,
                label: 'Arrival IATA',
                icon: Icons.flight_land,
              ),
              CustomTextField(
                controller: flightDateController,
                label: 'Flight Date',
                icon: Icons.date_range,
              ),
              ElevatedButton(
                onPressed: _searchFlights,
                child: const Text('Search'),
              ),
              if (_filteredFlights.isEmpty)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text('No results yet.'),
                ),
              for (final flight in _filteredFlights)
                ResultCard(
                  flightData: flight,
                  openDetails: () => _openDetails(flight),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
