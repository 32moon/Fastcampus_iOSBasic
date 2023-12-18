//
//  SearchUserResponse.swift
//  GithubUSerSearch_moon
//
//  Created by 이문정 on 2023/12/18.
//

import Foundation

struct SearchUserResponse: Decodable {
    var items: [SearchResult]
}
