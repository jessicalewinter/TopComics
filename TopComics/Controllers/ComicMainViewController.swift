//
//  ComicMainViewController.swift
//  TopComics
//
//  Created by Jessica Lewinter on 16/10/18.
//  Copyright © 2018 Jessica Lewinter. All rights reserved.
//

import UIKit

class ComicMainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        parseJSON()
    }
    
    func parseJSON(){
        let apiKey = "2a6cf3cd37e3e9daa367f78efc63fbddee943b92"
        var url = URL(string: "https://comicvine.gamespot.com/api/characters/?api_key=\(apiKey)&format=json&limit=1")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data, error == nil else{
                print("Error: \(error?.localizedDescription)" ?? "Error to fetch url")
                return
            }
            do{
                let decoder = JSONDecoder()
                let comicData = try decoder.decode(Comic.self, from: dataResponse)
                print("My comic data is \(comicData)")
//                DispatchQueue.main.async {
//                    print(jsonResponse)
//                }
                
            } catch{
                DispatchQueue.main.async {
                    print("Unable to parse json in \(url)")
                }
                
            }
        }
        DispatchQueue.global(qos: .background).async {
            task.resume()
        }
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
