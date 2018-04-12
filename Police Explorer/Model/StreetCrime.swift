//
//  StreetCrime.swift
//  Police Explorer
//
//  Created by Aaron McTavish on 04/04/2018.
//

import Foundation


// Data types for deserialising network requests from: https://data.police.uk/docs/method/crime-street/

struct StreetCrime: Codable, CustomStringConvertible {


    // MARK: - Properties

    let category: String
    let location: StreetCrimeLocation
    let locationType: String
    let id: Int
    let month: String

    var description: String {
        return "\(id): \(category)"
    }

    var detailedDescription: String {
        return "Id: \(id)\n" +
            "Category: \(category)\n" +
            "Location: \(location)\n" +
            "Location Type: \(locationType)\n" +
            "Month: \(month)"
    }


    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case category
        case location
        case locationType   = "location_type"
        case id
        case month
    }

}


struct StreetCrimeLocation: Codable, CustomStringConvertible {


    // MARK: - Properties

    let latitude: String
    let longitude: String

    var description: String {
        return "(\(latitude), \(longitude))"
    }

}
