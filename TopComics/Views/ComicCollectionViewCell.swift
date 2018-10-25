//
//  ComicCollectionViewCell.swift
//  TopComics
//
//  Created by Jessica Lewinter on 17/10/18.
//  Copyright © 2018 Jessica Lewinter. All rights reserved.
//

import UIKit

class ComicCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var backgroundViewCell: UIView!
    @IBOutlet weak var imageComicCollection: UIImageView!
    @IBOutlet weak var labelComicCollection: UILabel!
    
    var row: Int = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        addCornerImage(cornerRadius: 10, image: imageComicCollection)
        addCornerAndShadow(cornerRadius: 10, view: backgroundViewCell, shadowCorner: 10, shadowColor: UIColor.black.cgColor, shadowOpacity: 0.5, shadowOffset: .zero)
    }
    
    func addCornerImage(cornerRadius: CGFloat, image: UIImageView) {
        image.layer.cornerRadius = cornerRadius
        image.layer.masksToBounds = true
        image.clipsToBounds = true
    }
    func addCornerAndShadow(cornerRadius: CGFloat, view: UIView, shadowCorner: CGFloat, shadowColor: CGColor, shadowOpacity: Float, shadowOffset: CGSize) {
        view.layer.cornerRadius = cornerRadius
        view.clipsToBounds = false
        //view.layer.masksToBounds = false
        view.layer.shadowColor = shadowColor
        view.layer.shadowRadius = shadowCorner
        view.layer.shadowOffset = shadowOffset
    }
    
    
    

}
