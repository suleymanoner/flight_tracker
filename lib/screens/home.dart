import 'package:flight_tracker/models/flight_response.dart';
import 'package:flight_tracker/screens/detail.dart';
import 'package:flight_tracker/services/api_service.dart';
import 'package:flight_tracker/widgets/flight_card.dart';
import 'package:flight_tracker/widgets/titles.dart';
import 'package:flutter/material.dart';
import 'package:flight_tracker/themes/app_theme.dart';
import 'package:flight_tracker/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

/*
  Because of the free API has limit of requests, I took one of the response and save it as constants.
  I worked on that constant response while developing, now I will open the fetch live data function.
*/

class _HomeScreenState extends State<HomeScreen> {
  // For using live data
  late Future<FlightResponse> _flights;

  // For using saved data
  //late FlightResponse _flights;

  @override
  void initState() {
    super.initState();
    // For using live data
    _flights = ApiService.fetchLiveFlights();

    // For using saved data
    // _flights = FlightResponse.fromJson(Constants.EXAMPLE_RESPONSE_JSON);
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
        title: const Text('Live Flights'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Titles(),
            Divider(
              color: kColorScheme.primary,
              thickness: 2,
            ),
            Expanded(
              child: FutureBuilder<FlightResponse>(
                future: _flights,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<FlightData> flightList = snapshot.data!.data;
                    return ListView.builder(
                      itemCount: flightList.length,
                      itemBuilder: (context, index) {
                        FlightData flightData = flightList[index];
                        return FlightCard(
                          flightData: flightData,
                          onTapFlight: () => _openDetails(flightData),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
