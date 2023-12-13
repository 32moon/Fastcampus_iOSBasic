//
//  NetworkService.swift
//  GithubUserProfile_moon
//
//  Created by 이문정 on 2023/12/13.
//

import Foundation
import Combine

///// Defines the Network service errors.
enum NetworkError: Error {
    case invalidRequest
    case invalidResponse
    case responseError(statusCode: Int)
    case jsonDecodingError(error: Error)
}
