//
//  HTTPRequestError.swift
//  
//
//  Created by Daniel Orellana on 28/02/23.
//

import Foundation
import Combine

public enum HTTPRequestError: LocalizedError, Equatable {
    case invalidRequest
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case error4xx(_ code: Int)
    case serverError
    case error5xx(_ code: Int)
    case decodingError
    case urlSessionFailed(_ error: URLError)
    case unknownError
}
