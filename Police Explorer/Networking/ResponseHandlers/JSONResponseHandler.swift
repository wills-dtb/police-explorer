//
//  JSONResponseHandler.swift
//  GitHub Scanner
//
//  Created by Aaron McTavish on 14/02/2017.
//  Copyright © 2017 ustwo Fampany Ltd. All rights reserved.
//


// swiftlint:disable large_tuple


import Foundation
import Result


/// Deserializes the JSON returned from a network response.
final class JSONResponseHandler: ResponseHandler {


    // MARK: - ResponseHandler

    func process<Output: Codable>(data: Data?,
                                         response: URLResponse?,
                                         error: Error?,
                                         completion: ((_ result: Output?,
                                                       _ error: NetworkError?) -> Void)?) {

        let validationResult = JSONResponseHandler.validateResponse(data: data,
                                                                    response: response,
                                                                    error: error)

        switch validationResult {
        case let .success(body, _):
            let deserializationResult: Result<Output, NetworkError> = deserializeJSON(data: body)

            switch deserializationResult {
            case let .success(result):
                completion?(result, nil)
                return

            case let .failure(deserializationError):
                completion?(nil, deserializationError)
                return
            }

        case let .failure(validationError):
            completion?(nil, validationError)
            return
        }
    }

    /// Deserializes the JSON into a model, if possible.
    ///
    /// - Parameter data: The JSON `Data` to deserialize.
    /// - Returns: If success, returns the deserialized model. Otherwise, returns a `NetworkError`.
    func deserializeJSON<Output: Codable>(data: Data) -> Result<Output, NetworkError> {
        do {
            print(String(data: data, encoding: String.Encoding.utf8))

            let result = try JSONDecoder().decode(Output.self, from: data)

            return .success(result)
        } catch {
            return .failure(NetworkError.invalidJSON(error: error))
        }
    }

}
