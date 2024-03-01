//
//  ImageLoader.swift
//  RickAndMorty
//
//  Created by Ahmed Darwish on 14/01/2024.
//

import Foundation
final class ImageLoader{
    static let shared = ImageLoader()
    private init(){}
    
    private var imageDataCache = NSCache<NSString,NSData>()
   
   public func downloadImage(_ url: URL,completion: @escaping (Result<Data,Error>)->Void){
       let key = url.absoluteString as NSString
       if let data = imageDataCache.object(forKey: key){
       //    print("reading from cache: \(key)")
           completion(.success(data as Data))
           return
       }
        let request  = URLRequest(url: url)
        let task  = URLSession.shared.dataTask(with: request) {[weak self] data, _, error in
            guard let data = data,error == nil else{
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            
            let value = data as NSData
            self?.imageDataCache.setObject(value, forKey: key)
            
            completion(.success(data))
        }
        task.resume()
    }
}
