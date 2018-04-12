//
//  CrimeDetailView.swift
//  Police Explorer
//
//  Created by Aaron McTavish on 11/04/2018.
//

import UIKit


final class CrimeDetailView: BaseView {


    // MARK: - Properties

    let textLabel = UILabel()


    // MARK: - View Lifecycle

    override func setup() {
        super.setup()

        textLabel.numberOfLines = 0
        addSubview(textLabel)

        backgroundColor = .white
    }

    override func setupConstraints() {
        super.setupConstraints()

        textLabel.translatesAutoresizingMaskIntoConstraints = false

        let margins = layoutMarginsGuide
        let guide = safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            textLabel.topAnchor.constraintEqualToSystemSpacingBelow(guide.topAnchor, multiplier: 1),
            textLabel.bottomAnchor.constraintGreaterThanOrEqualToSystemSpacingBelow(guide.bottomAnchor, multiplier: 1)
        ])
    }


    override func setupAccessibility() {
        super.setupAccessibility()

        textLabel.accessibilityIdentifier = Accessibility.CrimeDetailLabel
    }

}
