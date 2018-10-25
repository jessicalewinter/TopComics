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
    let imageCache = NSCache<NSString, UIImage>()
    var comic: ComicIssue?
    override func viewDidLoad() {
        super.viewDidLoad()
        parseJSON()
        comicTableView.delegate = self
        comicTableView.dataSource = self
        comicTableView.register(UINib(nibName: "ComicTableViewCell", bundle: nil), forCellReuseIdentifier: "TableCell")
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        headerView.backgroundColor = .blue
        comicTableView.tableHeaderView = headerView
        
        if traitCollection.forceTouchCapability == UIForceTouchCapability.available {
            registerForPreviewing(with: self, sourceView: comicTableView)
        } else{
            print("3D Touch not available")
        }
        
            }

    override func viewWillAppear(_ animated: Bool) {
        if let index = self.comicTableView.indexPathForSelectedRow{
            self.comicTableView.deselectRow(at: index, animated: true)
        }
    }
    
    func parseJSON(){
        let apiKey = "2a6cf3cd37e3e9daa367f78efc63fbddee943b92"
        let url = URL(string: "https://comicvine.gamespot.com/api/issues/?api_key=\(apiKey)&format=json&limit=18")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data, error == nil else{
                print("Error: \(String(describing: error?.localizedDescription))")
                return
            }
            do{
                let decoder = JSONDecoder()
                let comicData = try decoder.decode(ComicIssue.self, from: dataResponse)
                
                DispatchQueue.main.async {
                    self.comic = comicData
                    self.comicTableView.reloadData()
                    print("My comic data is \(String(describing: comicData.issueResults[0].name))")
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first!
        let location = touch.location(in: comicTableView)
        
        guard let tableViewIndexPath = comicTableView.indexPathForRow(at: location) else { return }
        guard let tableViewCell = comicTableView.cellForRow(at: tableViewIndexPath) as? ComicTableViewCell else { return }
        guard let collectionView = tableViewCell.comicCollectionView else { return }
        let collectionViewLocation = comicTableView.convert(location, to: collectionView)
        guard let collectionViewIndexPath = collectionView.indexPathForItem(at: collectionViewLocation) else { return }
        guard let collectionViewCell = collectionView.cellForItem(at: collectionViewIndexPath) as? ComicCollectionViewCell else { return }
        
        performSegue(withIdentifier: "DetailSegue", sender: collectionViewCell)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSegue" {
            guard let collectionCell = sender as? ComicCollectionViewCell else {return}
            guard let collectionView = collectionCell.superview as? UICollectionView else { return }
            if let destinationViewController = segue.destination as? ComicDetailViewController {
                destinationViewController.bookDetailView.bookLabel.text = collectionCell.labelComicCollection.text
                destinationViewController.bookDetailView.bookImage = collectionCell.imageComicCollection
            }
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

}

extension ComicMainViewController: UIViewControllerPreviewingDelegate{
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        guard let tableViewIndexPath = comicTableView.indexPathForRow(at: location) else { return nil }
        guard let tableViewCell = comicTableView.cellForRow(at: tableViewIndexPath) as? ComicTableViewCell else { return nil }
        guard let collectionView = tableViewCell.comicCollectionView else { return nil }
        let collectionViewLocation = comicTableView.convert(location, to: collectionView)
        guard let collectionViewIndexPath = collectionView.indexPathForItem(at: collectionViewLocation) else { return nil }
        guard let collectionViewCell = collectionView.cellForItem(at: collectionViewIndexPath) as? ComicCollectionViewCell else { return nil }
        
        guard let previewView = storyboard?.instantiateViewController(withIdentifier: "ViewPeekAndPop") as? PeekAndPopViewController else {return nil}
        previewView.preferredContentSize = CGSize(width: 0, height: 400)
        previewView.image = collectionViewCell.imageComicCollection.image
        
        var sourceRect = collectionViewCell.frame
        sourceRect.origin.x = sourceRect.origin.x - collectionView.contentOffset.x
        
        let y = tableViewCell.frame.origin.y + collectionViewCell.frame.origin.y
        sourceRect.origin.y = y
        previewingContext.sourceRect = sourceRect
        
        previewView.delegate = self
        
        return previewView
       
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        
    }
    
    
}

extension ComicMainViewController: AlertDelegate {
    func showAlert() {
        let firstAlert = UIAlertController(title: "Book has been added to your Favorite's List", message: "", preferredStyle: .alert)
        let dismissFunc = {
            firstAlert.dismiss(animated: true)
        }
        self.present(firstAlert, animated: true) {
            let deadline = DispatchTime.now() + .seconds(1)
            DispatchQueue.main.asyncAfter(deadline: deadline, execute: dismissFunc)
        }
    }
    
    
}
