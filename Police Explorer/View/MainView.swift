//
//  MainView.swift
//  Police Explorer
//
//  Created by Aaron McTavish on 04/04/2018.
//

import UIKit


final class MainView: BaseView {


    // MARK: - Properties

    let stackView = UIStackView()


    // MARK: - Setup

    override func setup() {
        super.setup()

        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.alignment = .fill
        addSubview(stackView)
    }

    override func setupConstraints() {
        super.setupConstraints()

        stackView.translatesAutoresizingMaskIntoConstraints = false

        let margins = layoutMarginsGuide
        let guide = safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            stackView.topAnchor.constraintEqualToSystemSpacingBelow(guide.topAnchor, multiplier: 1),
            stackView.bottomAnchor.constraintGreaterThanOrEqualToSystemSpacingBelow(guide.bottomAnchor, multiplier: 1)
        ])
    }

}
