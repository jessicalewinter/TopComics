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
    
    var comic: Comic?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parseJSON()
        comicTableView.delegate = self
        comicTableView.dataSource = self
        comicTableView.register(UINib(nibName: "ComicTableViewCell", bundle: nil), forCellReuseIdentifier: "TableCell")
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        headerView.backgroundColor = .blue
        comicTableView.tableHeaderView = headerView
    }

    override func viewWillAppear(_ animated: Bool) {
        if let index = self.comicTableView.indexPathForSelectedRow{
            self.comicTableView.deselectRow(at: index, animated: true)
        }
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
                    self.comic = comicData
                    self.comicTableView.reloadData()
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
}

extension ComicMainViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = comicTableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! ComicTableViewCell
        cell.comicArray = comic
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return comicTableView.frame.size.height/2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "fuck"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        comicTableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension ComicMainViewController: UITableViewDelegate{
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        if section == 0{
//            let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
//            view.backgroundColor = .blue
//
//            return view
//        } else {
//            return nil
//        }
//    }
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        if section == 0{
//            return tableView.frame.size.height/2
//        } else {
//            return 0
//        }
//
//    }
    
}

