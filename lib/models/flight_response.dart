class FlightResponse {
  final Pagination pagination;
  final List<FlightData> data;

  FlightResponse({
    required this.pagination,
    required this.data,
  });

  FlightResponse.fromJson(Map<String, dynamic> json)
      : pagination = Pagination.fromJson(json['pagination']),
        data = (json['data'] as List)
            .map((data) => FlightData.fromJson(data))
            .toList();
}

class Pagination {
  final int limit;
  final int offset;
  final int count;
  final int total;

  Pagination({
    required this.limit,
    required this.offset,
    required this.count,
    required this.total,
  });

  Pagination.fromJson(Map<String, dynamic> json)
      : limit = json['limit'] ?? 0,
        offset = json['offset'] ?? 0,
        count = json['count'] ?? 0,
        total = json['total'] ?? 0;
}

class FlightData {
  final String flightDate;
  final String flightStatus;
  final Departure departure;
  final Arrival arrival;
  final Airline airline;
  final Flight flight;

  FlightData({
    required this.flightDate,
    required this.flightStatus,
    required this.departure,
    required this.arrival,
    required this.airline,
    required this.flight,
  });

  FlightData.fromJson(Map<String, dynamic> json)
      : flightDate = json['flight_date'] ?? '',
        flightStatus = json['flight_status'] ?? '',
        departure = Departure.fromJson(json['departure'] ?? {}),
        arrival = Arrival.fromJson(json['arrival'] ?? {}),
        airline = Airline.fromJson(json['airline'] ?? {}),
        flight = Flight.fromJson(json['flight'] ?? {});
}

class Departure {
  final String airport;
  final String timezone;
  final String iata;
  final String icao;
  final String terminal;
  final dynamic gate;
  final dynamic delay;
  final String scheduled;
  final String estimated;
  final dynamic actual;
  final dynamic estimatedRunway;
  final dynamic actualRunway;

  Departure({
    required this.airport,
    required this.timezone,
    required this.iata,
    required this.icao,
    required this.terminal,
    required this.gate,
    required this.delay,
    required this.scheduled,
    required this.estimated,
    required this.actual,
    required this.estimatedRunway,
    required this.actualRunway,
  });

  Departure.fromJson(Map<String, dynamic> json)
      : airport = json['airport'] ?? '',
        timezone = json['timezone'] ?? '',
        iata = json['iata'] ?? '',
        icao = json['icao'] ?? '',
        terminal = json['terminal'] ?? '',
        gate = json['gate'],
        delay = json['delay'],
        scheduled = json['scheduled'] ?? '',
        estimated = json['estimated'] ?? '',
        actual = json['actual'],
        estimatedRunway = json['estimated_runway'],
        actualRunway = json['actual_runway'];
}

class Arrival {
  final String airport;
  final String timezone;
  final String iata;
  final String icao;
  final String terminal;
  final dynamic gate;
  final dynamic baggage;
  final dynamic delay;
  final String scheduled;
  final String estimated;
  final dynamic actual;
  final dynamic estimatedRunway;
  final dynamic actualRunway;

  Arrival({
    required this.airport,
    required this.timezone,
    required this.iata,
    required this.icao,
    required this.terminal,
    required this.gate,
    required this.baggage,
    required this.delay,
    required this.scheduled,
    required this.estimated,
    required this.actual,
    required this.estimatedRunway,
    required this.actualRunway,
  });

  Arrival.fromJson(Map<String, dynamic> json)
      : airport = json['airport'] ?? '',
        timezone = json['timezone'] ?? '',
        iata = json['iata'] ?? '',
        icao = json['icao'] ?? '',
        terminal = json['terminal'] ?? '',
        gate = json['gate'],
        baggage = json['baggage'],
        delay = json['delay'],
        scheduled = json['scheduled'] ?? '',
        estimated = json['estimated'] ?? '',
        actual = json['actual'],
        estimatedRunway = json['estimated_runway'],
        actualRunway = json['actual_runway'];
}

class Airline {
  final String name;
  final String iata;
  final String icao;

  Airline({
    required this.name,
    required this.iata,
    required this.icao,
  });

  Airline.fromJson(Map<String, dynamic> json)
      : name = json['name'] ?? '',
        iata = json['iata'] ?? '',
        icao = json['icao'] ?? '';
}

class Flight {
  final String number;
  final String iata;
  final String icao;
  final Codeshared? codeshared;

  Flight({
    required this.number,
    required this.iata,
    required this.icao,
    this.codeshared,
  });

  Flight.fromJson(Map<String, dynamic> json)
      : number = json['number'] ?? '',
        iata = json['iata'] ?? '',
        icao = json['icao'] ?? '',
        codeshared = json['codeshared'] != null
            ? Codeshared.fromJson(json['codeshared'])
            : null;
}

class Codeshared {
  final String airlineName;
  final String airlineIata;
  final String airlineIcao;
  final String flightNumber;
  final String flightIata;
  final String flightIcao;

  Codeshared({
    required this.airlineName,
    required this.airlineIata,
    required this.airlineIcao,
    required this.flightNumber,
    required this.flightIata,
    required this.flightIcao,
  });

  Codeshared.fromJson(Map<String, dynamic> json)
      : airlineName = json['airline_name'] ?? '',
        airlineIata = json['airline_iata'] ?? '',
        airlineIcao = json['airline_icao'] ?? '',
        flightNumber = json['flight_number'] ?? '',
        flightIata = json['flight_iata'] ?? '',
        flightIcao = json['flight_icao'] ?? '';
}
