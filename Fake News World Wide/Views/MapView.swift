//
//  MapView.swift
//  Fake News World Wide
//
//  Created by Ben Cooper on 5/9/23.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    @Binding var locations: [Location]
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.mapType = .hybridFlyover
        
        mapView.region = MKCoordinateRegion(
                            center: CLLocationCoordinate2D(
                                latitude: 40.83834587046632,
                                longitude: 14.254053016537693),
                            span: MKCoordinateSpan(
                                latitudeDelta: 180,
                                longitudeDelta: 180)
                            )
        
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        for location in locations {
            let pin = MKPointAnnotation()
            
            pin.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
            pin.title = location.title
            
    
            view.addAnnotation(pin)
        }
    }
}
