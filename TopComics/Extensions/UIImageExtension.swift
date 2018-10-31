//
//  UIImageExtension.swift
//  TopComics
//
//  Created by Jessica Lewinter on 23/10/18.
//  Copyright © 2018 Jessica Lewinter. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit,row: Int? = nil,imageCache: NSCache<NSString, UIImage>? = nil,completion: ((UIImage, Int?) -> Void)? = nil) {
        contentMode = mode
        
        if let imageCache = imageCache{
            guard let cachedImage = imageCache.object(forKey: (url.absoluteString as NSString)) else {
                URLSession.shared.dataTask(with: url) { data, response, error in
                    guard
                        let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                        let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                        let data = data, error == nil,
                        let image = UIImage(data: data)
                        else { return }
                    DispatchQueue.main.async() {
                        if let completion = completion{
                            completion(image,row)
                        }
                        else{
                            self.image = image
                        }
                        imageCache.setObject(image, forKey: (url.absoluteString as NSString))
                    }
                }.resume()
                return
            }
            if let completion = completion{
                completion(cachedImage,row)
            }
            else{
                self.image = cachedImage
            }
        }
        else{
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard
                    let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                    let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                    let data = data, error == nil,
                    let image = UIImage(data: data)
                    else { return }
                DispatchQueue.main.async() {
                    if let completion = completion{
                        completion(image,row)
                    }
                    else{
                        self.image = image
                    }
                }
            }.resume()
        }
    }
}
