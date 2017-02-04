import MapKit

let arguments = CommandLine.arguments.dropFirst()
if arguments.isEmpty {
    print("Usage: mkgpx QUERY", to: &stderrStream)
    exit(EXIT_FAILURE)
}

let query = arguments.joined(separator: " ")
let request = MKLocalSearchRequest()
request.naturalLanguageQuery = query

let search = MKLocalSearch(request: request)
search.start { response, error in
    if let error = error {
        print(error.localizedDescription, to: &stderrStream)
        exit(EXIT_FAILURE)
    }

    guard let placemark = response?.mapItems.first?.placemark else {
        print("No locations found for '\(query)'", to: &stderrStream)
        exit(EXIT_FAILURE)
    }

    guard let coordinate = placemark.location?.coordinate else {
        print("No coordinate found for '\(placemark.name)'", to: &stderrStream)
        exit(EXIT_FAILURE)
    }

    let gpxFile = GPXFile(coordinate: coordinate, name: placemark.name)
    print(gpxFile.contents)
    exit(0)
}

dispatchMain()
