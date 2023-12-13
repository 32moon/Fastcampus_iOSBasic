import UIKit
import Combine

enum NetworkError: Error {
    case errSecInvalidRequest
    case transportError(Error)
    case responseError(statusCode: Int)
    case noData
    case decodingError(Error)
}

struct GithubProfile: Codable {
    let login: String
    let avatarUrl: String
    let htmlUrl: String
    let followers: Int
    let following: Int
    
    enum CodingKeys: String, CodingKey {
        // JOSN 데이터 키값
        case login
        case avatarUrl = "avatar_url"
        case htmlUrl = "html_url"
        case followers
        case following
    }
}

final class NetworkService {
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        session = URLSession(configuration: configuration)
    }
    
    func fetchProfile(userName: String) -> AnyPublisher<GithubProfile, Error> {
        let url = URL(string: "http://api.github.com/users/\(userName)")!
        
        let publisher = session
            .dataTaskPublisher(for: url)
        // 서버에서 받은 response 확인 및 data 확인
            .tryMap { result -> Data in
                guard let httpResponse = result.response as? HTTPURLResponse,
                      (200..<300).contains(httpResponse.statusCode) else {
                    let response = result.response as? HTTPURLResponse
                    let statusCode = response?.statusCode ?? -1
                    throw NetworkError.responseError(statusCode: statusCode)
                }
                return result.data
            }
            .decode(type: GithubProfile.self, decoder: JSONDecoder())
            .eraseToAnyPublisher() // type erase : 타입을 지워주는 역할
        return publisher
    }
}

let networkService = NetworkService(configuration: .default)

let subscription = networkService
    .fetchProfile(userName: "32moon")
    .receive(on: RunLoop.main)
    .print()
    .sink { completion in
        print("completion: \(completion)")
    } receiveValue: { profile in
        print("profile : \(profile)")
    }

