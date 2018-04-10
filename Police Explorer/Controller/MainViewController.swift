//
//  MainViewController.swift
//  Police Explorer
//
//  Created by Aaron McTavish on 04/04/2018.
//

import MapKit
import UIKit


class MainViewController: BaseViewController<MainView>, CLLocationManagerDelegate, MapViewControllerDelegate {


    // MARK: - Properties

    let crimeTableController = CrimeTableViewController()
    let mapController = MapViewController()

    let locationManager = CLLocationManager()
    var initiallyCentered = false


    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        view.backgroundColor = .white

        title = "Crimes"

        setUpMapController()
        setUpCrimeTableController()

        locationManager.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let authStatus = CLLocationManager.authorizationStatus()

        if authStatus == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
        } else if authStatus == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
    }


    // MARK: - Set Up

    private func setUpCrimeTableController() {
        addChildViewController(crimeTableController)
        underlyingView.stackView.addArrangedSubview(crimeTableController.view)
        crimeTableController.didMove(toParentViewController: self)
    }

    private func setUpMapController() {
        addChildViewController(mapController)
        underlyingView.stackView.addArrangedSubview(mapController.view)
        mapController.didMove(toParentViewController: self)

        mapController.delegate = self
    }


    // MARK: - CLLocationManagerDelegate

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            manager.startUpdatingLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        centerMapOnUser()
    }


    // MARK: - MapViewControllerDelegate

    func mapRegionChanged(_ region: MKCoordinateRegion) {
        let halfLatDelta = region.span.latitudeDelta / 2
        let halfLongData = region.span.longitudeDelta / 2

        let a = CLLocationCoordinate2D(latitude: region.center.latitude + halfLatDelta,
                                             longitude: region.center.longitude - halfLongData)
        let d = CLLocationCoordinate2D(latitude: region.center.latitude - halfLatDelta,
                                                 longitude: region.center.longitude + halfLongData)

        let b = CLLocationCoordinate2D(latitude: a.latitude, longitude: d.longitude)
        let c = CLLocationCoordinate2D(latitude: d.latitude, longitude: a.longitude)

        let polyArray = [a,b,c,d].map {
                return "\($0.latitude),\($0.longitude)"
            }.joined(separator: ":")

        let url = PoliceAPI.StreetCrime.allStreetCrime.url

        // Fetch
        StreetLevelAPI.getAllStreetCrimes(url: url, regionCoordinates: polyArray) { [weak self] result in
            switch result {
            case let .success(fetchedCrimes):
                DispatchQueue.main.async {
                    self?.crimeTableController.crimes = fetchedCrimes
                    print("Fetched crimes count: \(fetchedCrimes.count)")
                }
            case let .failure(error):
                print(error)
            }
        }
    }


    // MARK: - Convenience

    func centerMapOnUser() {
        let mapView = mapController.underlyingView.contentView

        if let userLocation = mapView.userLocation.location {
            let delta = 0.005
            let region = MKCoordinateRegion(center: userLocation.coordinate,
                                            span: MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta))
            mapView.setRegion(region, animated: true)

            locationManager.stopUpdatingLocation()
            locationManager.delegate = nil
        }
    }

}

