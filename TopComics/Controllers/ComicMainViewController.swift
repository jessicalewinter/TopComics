//
//  ComicMainViewController.swift
//  TopComics
//
//  Created by Jessica Lewinter on 16/10/18.
//  Copyright © 2018 Jessica Lewinter. All rights reserved.
//

import UIKit

class ComicMainViewController: UIViewController {

    @IBOutlet weak var comicTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parseJSON()
        comicTableView.delegate = self
        comicTableView.dataSource = self
        comicTableView.register(UINib(nibName: "ComicTableViewCell", bundle: nil), forCellReuseIdentifier: "TableCell")
    }
    
    func parseJSON(){
        let apiKey = "2a6cf3cd37e3e9daa367f78efc63fbddee943b92"
        let url = URL(string: "https://comicvine.gamespot.com/api/characters/?api_key=\(apiKey)&format=json&limit=18")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data, error == nil else{
                print("Error: \(String(describing: error?.localizedDescription))")
                return
            }
            do{
                let decoder = JSONDecoder()
                let comicData = try decoder.decode(Comic.self, from: dataResponse)
                
                DispatchQueue.main.async {
                    print("My comic data is \(comicData.characterResults[0].name!)")
                }
                
            } catch{
                DispatchQueue.main.async {
                    print(error)
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

extension ComicMainViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = comicTableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! ComicTableViewCell
        cell.labelTableView.text = "oi"
        return cell
    }
    
    
}


//extension ComicMainViewController: UICollectionViewDelegate, UICollectionViewDataSource{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 1
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ComicMainCollectionViewCell
//        cell.labelComicCell.text = "Hello muggles"
//        
//        return cell
//    }
    
    
//}
