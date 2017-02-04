import CoreLocation

public struct GPXFile {
    let coordinate: CLLocationCoordinate2D
    let name: String?

    var contents: String {
        return "<?xml version=\"1.0\"?>\n" +
               "<gpx version=\"1.1\" creator=\"Xcode\">\n" +
               "    <wpt lat=\"\(self.coordinate.latitude)\" lon=\"\(self.coordinate.longitude)\">\n" +
               "        <name>\(self.name ?? "Unknown")</name>\n" +
               "    </wpt>\n" +
               "</gpx>"
    }
}
