//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by Shawn Cole on 5/16/24.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    let baseURL = "https://api.github.com"
    let followersPerPage = 100
    
    func getFollowers(for username: String, page: Int, completion: @escaping ([Follower]?, ErrorMessage?) -> Void) {
        let endpoint = baseURL + "/users/\(username)/followers?per_page=\(followersPerPage)"
        guard let url = URL(string: endpoint) else {
            completion(nil, .invalidUsername)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(nil, .unableToComplete)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(nil, .invalidResponse)
                return
            }
            
            guard let data else {
                completion(nil, .invalidData)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completion(followers, nil)
            } catch {
                completion(nil, .invalidData)
            }
        }
        
        task.resume()
    }
}
