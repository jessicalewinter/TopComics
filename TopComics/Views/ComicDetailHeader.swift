//
//  ComicDetail.swift
//  TopComics
//
//  Created by Jessica Lewinter on 25/10/18.
//  Copyright © 2018 Jessica Lewinter. All rights reserved.
//

import UIKit

class ComicDetailHeader: UIView {

    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var bookLabel: UILabel!
    @IBOutlet weak var issueLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("ComicDetailHeader", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
