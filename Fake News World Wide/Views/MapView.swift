//
//  MapView.swift
//  Fake News World Wide
//
//  Created by Ben Cooper on 5/9/23.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    @State var locations: [Location]
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.mapType = .hybridFlyover
        
        mapView.region = MKCoordinateRegion(
                            center: CLLocationCoordinate2D(
                                latitude: 40.83834587046632,
                                longitude: 14.254053016537693),
                            span: MKCoordinateSpan(
                                latitudeDelta: 90,
                                longitudeDelta: 90)
                            )
        
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        for location in locations {
            // make a pins
            let pin = MKPointAnnotation()
            
            // set the coordinates
            pin.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
            
            // set the title
            pin.title = location.title
            
            // add to map
            view.addAnnotation(pin)
        }
    }
}
