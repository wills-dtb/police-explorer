//
//  StreetCrime.swift
//  Police Explorer
//
//  Created by Aaron McTavish on 04/04/2018.
//

import Foundation


// Data types for deserialising network requests from: https://data.police.uk/docs/method/crime-street/

struct StreetCrime: Codable {


    // MARK: - Properties

    let category: String
    let location: StreetCrimeLocation
    let id: Int

}


struct StreetCrimeLocation: Codable {


    // MARK: - Properties

    let latitude: String
    let longitude: String

}
