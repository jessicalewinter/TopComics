//
//  ComicTableViewCell.swift
//  TopComics
//
//  Created by Jessica Lewinter on 17/10/18.
//  Copyright © 2018 Jessica Lewinter. All rights reserved.
//

import UIKit

class ComicTableViewCell: UITableViewCell{
    var delegate: CellCollectionViewDelegate?
    let imageCache = NSCache<NSString, UIImage>()
    var comicArray: ComicIssue? {
        didSet {
            comicCollectionView.reloadData()
        }
    }
    
    @IBOutlet weak var comicCollectionView: UICollectionView!
    let minimumInteritemSpacing: CGFloat = 10
    let minimumLineSpacing: CGFloat = 20
    //let paginationCollectionView = UICollectionView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        comicCollectionView.delegate = self
        comicCollectionView.dataSource = self
        comicCollectionView.register(UINib(nibName: "ComicCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionCell")
    }
    
    
}


extension ComicTableViewCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = comicCollectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! ComicCollectionViewCell
        let issueResults = comicArray?.issueResults
        cell.labelComicCollection.text = issueResults?[indexPath.row].name ?? "Null"
        cell.row = indexPath.row
        
        if let image = issueResults?[indexPath.row].image {
            if let url = URL(string: image) {
                cell.imageComicCollection.downloadedFrom(url: url, contentMode: .scaleAspectFill, row: indexPath.row, imageCache: imageCache) { (image, row) in
                    if row == cell.row{
                        cell.imageComicCollection.image = image
                    }
                }
            }
        }
        return cell
    }
    
}

extension ComicTableViewCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.size.width/2 - (minimumInteritemSpacing + minimumLineSpacing), height: collectionView.bounds.size.height)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return minimumLineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return minimumInteritemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? ComicCollectionViewCell else {return}
        self.delegate?.didSelect(cell: cell)
    }
}

