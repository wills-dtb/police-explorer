//
//  StreetLevelAPI.swift
//  Police Explorer
//
//  Created by Aaron McTavish on 05/04/2018.
//

import Foundation
import Result


private typealias CrimesFetchCompletion = ([StreetCrime]?, NetworkError?) -> Void

struct StreetLevelAPI {


    // MARK: - Types

    private struct Constants {
        static let polygonParameterKey   = "poly"
    }


    // MARK: - Fetch

    static func getAllStreetCrimes(url: URL, regionCoordinates: String, completion completionHandler: ((Result<[StreetCrime], NetworkError>) -> Void)?) {
        let innerCompletion: CrimesFetchCompletion = { fetchedCrimes, responseError in
            if let responseError = responseError {
                completionHandler?(.failure(responseError))
                return
            } else if let fetchedCrimes = fetchedCrimes {
                completionHandler?(.success(fetchedCrimes))
                return
            }

            completionHandler?(.failure(.unknown(error: nil)))
        }

        var request = URLRequest(url: url)
        RequestTransformers.addURLParameters.transform(request: &request,
                                                       value: [Constants.polygonParameterKey: regionCoordinates])

        Clients.ephemeral.dataTask(with: request, completion: innerCompletion)
    }

}
