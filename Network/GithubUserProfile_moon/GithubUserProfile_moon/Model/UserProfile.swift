//
//  UserProfile.swift
//  GithubUserProfile_moon
//
//  Created by 이문정 on 2023/12/13.
//

import Foundation

// Hashable를 준수하고 있는 struct에 대하여: https://ios-development.tistory.com/675
// Identifiable를 준수하고 있는 struct에 대하여 https://ronick-grammer.github.io/swift/Identifiable-%ED%94%84%EB%A1%9C%ED%86%A0%EC%BD%9C/

struct UserProfile: Decodable, Hashable, Identifiable {
    var id: Int64
    var login: String
    var name: String
    var avatarUrl: URL
    var htmlUrl: String
    var followers: Int
    var following: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case login
        case avatarUrl = "avatar_url"
        case htmlUrl = "html_url"
        case followers
        case following
    }
}
