//
//  MapView.swift
//  Police Explorer
//
//  Created by Aaron McTavish on 04/04/2018.
//

import MapKit
import UIKit


final class MapView: BaseView {


    // Mark: - Properties

    let contentView = MKMapView()


    // MARK: - View Lifecycle

    override func setup() {
        super.setup()

        contentView.showsUserLocation = true

        addSubview(contentView)
    }

    override func setupConstraints() {
        super.setupConstraints()

        contentView.translatesAutoresizingMaskIntoConstraints = false

        let margins = layoutMarginsGuide
        let guide = safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            contentView.topAnchor.constraintEqualToSystemSpacingBelow(guide.topAnchor, multiplier: 1),
            contentView.bottomAnchor.constraintGreaterThanOrEqualToSystemSpacingBelow(guide.bottomAnchor, multiplier: 1)
        ])
    }

    override func setupAccessibility() {
        super.setupAccessibility()

        contentView.accessibilityIdentifier = Accessibility.MapViewContent
    }

}
