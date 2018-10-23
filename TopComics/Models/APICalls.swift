////
////  APICalls.swift
////  TopComics
////
////  Created by Jessica Lewinter on 19/10/18.
////  Copyright © 2018 Jessica Lewinter. All rights reserved.
////
//
//import UIKit
//
//class APICalls {
//    
//    
//    static func parseJSON(url: URL, key: String, arrayComic:[Comic], table: UITableView){
//        let apiKey = "2a6cf3cd37e3e9daa367f78efc63fbddee943b92"
//        let url = URL(string: "https://comicvine.gamespot.com/api/characters/?api_key=\(apiKey)&format=json&limit=18")!
//        
//        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//            guard let dataResponse = data, error == nil else{
//                print("Error: \(String(describing: error?.localizedDescription))")
//                return
//            }
//            do{
//                let decoder = JSONDecoder()
//                let comicData = try decoder.decode(Comic.self, from: dataResponse)
//                
//                DispatchQueue.main.async {
//                    self.comic = comicData
//                    self.comicTableView.reloadData()
//                    print("My comic data is \(comicData.characterResults[0].name!)")
//                }
//                
//            } catch{
//                DispatchQueue.main.async {
//                    print(error)
//                    print("Unable to parse json in \(url)")
//                }
//                
//            }
//        }
//        DispatchQueue.global(qos: .background).async {
//            task.resume()
//        }
//        
//        
//    }
//    
//}
