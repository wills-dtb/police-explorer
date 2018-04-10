//
//  PoliceAPI.swift
//  Police Explorer
//
//  Created by Aaron McTavish on 05/04/2018.
//

import Foundation

/// Collection of API endpoints for https://data.police.uk/.
struct PoliceAPI {

    /// Base url for all API requests.
    fileprivate static let baseURL = "https://data.police.uk/api"


    /// Collection of API endpoints for accessing street crime data.
    enum StreetCrime {
        case allStreetCrime
    }

}

extension PoliceAPI.StreetCrime {

    /// `URL` for the endpoint.
    public var url: URL {
        guard let result = URL(string: PoliceAPI.baseURL + self.path) else {
            fatalError("Failed to create URL with path: \(self.path).")
        }

        return result
    }

    /// Path to append to the base url for the endpoint.
    private var path: String {
        switch self {
            case .allStreetCrime:
                return "/crimes-street/all-crime"
        }
    }

}
