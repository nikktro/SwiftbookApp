//
//  ImageManager.swift
//  SwiftbookApp
//
//  Created by Nikolay Trofimov on 25.01.2023.
//

import Foundation

class ImageManager {
    static let shared = ImageManager()
        
    private init() {}
    
    func fetchImageData(from url: URL?, completion: @escaping (_ imageData: Data) -> Void) {
        guard let url = url else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "Error: No description")
                return
            }
            DispatchQueue.main.async {
                completion(data)
            }
        }.resume()
    }
    
}
