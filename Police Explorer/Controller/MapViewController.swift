//
//  MapViewController.swift
//  Police Explorer
//
//  Created by Aaron McTavish on 04/04/2018.
//

import MapKit
import UIKit


protocol MapViewControllerDelegate: class {

    func mapRegionChanged(_ region: MKCoordinateRegion)

}


final class MapViewController: BaseViewController<MapView>, MKMapViewDelegate {


    // MARK: - Properties

    weak var delegate: MapViewControllerDelegate?


    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        underlyingView.contentView.delegate = self
    }


    // MARK: - MKMapViewDelegate

    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        delegate?.mapRegionChanged(mapView.region)
    }

}
