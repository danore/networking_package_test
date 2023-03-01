//
//  APIClient.swift
//  
//
//  Created by Daniel Orellana on 28/02/23.
//

import Foundation
import Combine
import Utilities
import Protocols

struct APIClient {

    var baseURL: String = "https://jsonplaceholder.typicode.com"
    var networkDispatcher: HTTPDispatcher!

    init(networkDispatcher: HTTPDispatcher = HTTPDispatcher()) {
        self.networkDispatcher = networkDispatcher
    }

    /// Dispatches a Request and returns a publisher
    /// - Parameter request: Request to Dispatch
    /// - Returns: A publisher containing decoded data or an error
    func dispatch<R: HTTPRequest>(_ request: R) -> AnyPublisher<R.ReturnType, HTTPRequestError> {
        guard let urlRequest = request.asURLRequest(baseURL: baseURL) else {
            return Fail(outputType: R.ReturnType.self, failure: HTTPRequestError.badRequest).eraseToAnyPublisher()
        }

        typealias RequestPublisher = AnyPublisher<R.ReturnType, HTTPRequestError>
        let requestPublisher: RequestPublisher = networkDispatcher.dispatch(request: urlRequest)

        return requestPublisher.eraseToAnyPublisher()
    }
}
