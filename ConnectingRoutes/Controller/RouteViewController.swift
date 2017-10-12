//
//  RouteViewController.swift
//  ConnectingRoutes
//
//  Created by Chris Huang on 12/10/2017.
//  Copyright © 2017 Chris Huang. All rights reserved.
//

import UIKit
import MapKit

class RouteViewController: UIViewController {
	
	private var annotations = [MKPointAnnotation]()

	@IBOutlet weak var mapView: MKMapView! {
		didSet {
			let longPress = UILongPressGestureRecognizer(target: self, action: #selector(pinLocation(recongnizer:)))
			longPress.minimumPressDuration = 0.3
			mapView.addGestureRecognizer(longPress)
		}
	}
	
	@objc func pinLocation(recongnizer: UILongPressGestureRecognizer) {
		
		if recongnizer.state != .ended { return }
		
		// Get the location of the press
		let tappedPoint = recongnizer.location(in: mapView)
		
		// Convert the location from a point to a coordinate
		let tappedCoordinate = mapView.convert(tappedPoint, toCoordinateFrom: mapView)
		
		// With the coordinate, annotate the location on the map
		let annotation = MKPointAnnotation()
		annotation.coordinate = tappedCoordinate
		
		// Store the annotation for later use
		annotations.append(annotation)
		
		mapView.showAnnotations([annotation], animated: true)
	}
}
