//
//  ApiService.swift
//  arzaripov_2PW4
//
//  Created by Anton Zaripov on 24.10.2022.
//

import UIKit

final class ApiService {
    static let shared = ApiService()
    
    struct Constants {
        static let topNews = URL(string: "https://newsapi.org/v2/everything?q=Apple&from=2022-10-24&sortBy=popularity&apiKey=f68f2bb0424b4cd7b03dc6e1551d16a8")
    }
    
    private init() {}
    
    public func getTopStroies(completion: @escaping (Result<[Article], Error>) -> Void){ // Было Result[String]
        guard let url = Constants.topNews else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error{
                completion(.failure(error))
            } else if let data = data {
                do{
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    print("Articles: \(result.articles.count)")
                    completion(.success(result.articles))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        
        task.resume()
    }
}

struct APIResponse: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let source: Source
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
    /*
    init(title: String, description: String, imageURL: URL?) {
        self.title = title
        self.description = description
        urlToImage = imageURL
    }*/
}

struct Source: Codable{
    let name: String
}
