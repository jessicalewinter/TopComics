//
//  ComicTableViewCell.swift
//  TopComics
//
//  Created by Jessica Lewinter on 17/10/18.
//  Copyright © 2018 Jessica Lewinter. All rights reserved.
//

import UIKit

class ComicTableViewCell: UITableViewCell {
    @IBOutlet weak var labelTableView: UILabel!
    @IBOutlet weak var comicCollectionView: UICollectionView!
    let minimumInteritemSpacing: CGFloat = 10
    let minimumLineSpacing: CGFloat = 20
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        comicCollectionView.delegate = self
        comicCollectionView.dataSource = self
        comicCollectionView.register(UINib(nibName: "ComicCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension ComicTableViewCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = comicCollectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! ComicCollectionViewCell
         cell.labelComicCollection.text = "Spider-man"
         cell.backgroundColor = .red
        return cell
    }
}

extension ComicTableViewCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.size.width/2 - (minimumInteritemSpacing + minimumLineSpacing), height: collectionView.bounds.size.height - (minimumInteritemSpacing + minimumLineSpacing))
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
    
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets.init(top: 8, left: 8, bottom: 8, right: 8)
//    }
}


