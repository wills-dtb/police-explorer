//
//  CrimeDetailViewController.swift
//  Police Explorer
//
//  Created by Aaron McTavish on 11/04/2018.
//

import UIKit


final class CrimeDetailViewController: BaseViewController<CrimeDetailView> {


    // MARK: - Properties

    let crime: StreetCrime


    // MARK: - Initializers

    init(crime: StreetCrime) {
        self.crime = crime

        super.init()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Crime Details"

        underlyingView.textLabel.text = crime.detailedDescription
    }
    
}
