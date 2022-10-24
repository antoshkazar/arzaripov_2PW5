//
//  NewsViewModel.swift
//  arzaripov_2PW4
//
//  Created by Anton Zaripov on 24.10.2022.
//

import UIKit

final class NewsViewModel: Codable {
    let title: String
    let description: String
    let imageURL: URL? // Было URL?
    var imageData: Data? = nil
    
    init(title: String, description: String, imageURL: URL?) {
        self.title = title
        self.description = description
        self.imageURL = imageURL
    }
}
