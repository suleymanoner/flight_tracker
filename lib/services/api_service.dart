import 'dart:convert';
import 'package:flight_tracker/models/flight_response.dart';
import 'package:http/http.dart' as http;
import 'package:flight_tracker/utils/constants.dart';

class ApiService {
  static Future<FlightResponse> fetchLiveFlights() async {
    final response = await http
        .get(Uri.parse('${Constants.API_URL}?access_key=${Constants.API_KEY}'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      if (jsonResponse['data'] is List) {
        List<FlightData> flights = (jsonResponse['data'] as List)
            .map((data) => FlightData.fromJson(data))
            .toList();

        Pagination pagination = Pagination.fromJson(jsonResponse['pagination']);

        return FlightResponse(pagination: pagination, data: flights);
      } else {
        throw Exception('Data is not in the expected format');
      }
    } else {
      throw Exception('Failed to load flights!');
    }
  }

  // Searching locally because there is no search endpoint on API.
  // Because of that, this search function only work on constant response which I saved before.

  static List<FlightData> searchFlightsLocally({
    required List<FlightData> flights,
    String? flightNumber,
    String? airlineIata,
    String? depIata,
    String? arrIata,
    String? flightDate,
  }) {
    return flights.where((flight) {
      final queryFlightNumber = flightNumber?.toLowerCase() ?? '';
      final queryAirlineIata = airlineIata?.toLowerCase() ?? '';
      final queryDepIata = depIata?.toLowerCase() ?? '';
      final queryArrIata = arrIata?.toLowerCase() ?? '';
      final queryFlightDate = flightDate?.toLowerCase() ?? '';

      final matchesFlightNumber = queryFlightNumber.isEmpty ||
          flight.flight.iata.toLowerCase().contains(queryFlightNumber);
      final matchesAirlineIata = queryAirlineIata.isEmpty ||
          flight.airline.iata.toLowerCase() == queryAirlineIata;
      final matchesDepIata = queryDepIata.isEmpty ||
          flight.departure.iata.toLowerCase() == queryDepIata;
      final matchesArrIata = queryArrIata.isEmpty ||
          flight.arrival.iata.toLowerCase() == queryArrIata;
      final matchesFlightDate = queryFlightDate.isEmpty ||
          flight.flightDate.toLowerCase() == queryFlightDate;

      return matchesFlightNumber &&
          matchesAirlineIata &&
          matchesDepIata &&
          matchesArrIata &&
          matchesFlightDate;
    }).toList();
  }
}
