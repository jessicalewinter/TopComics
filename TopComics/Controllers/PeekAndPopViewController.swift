//
//  PeekAndPopViewController.swift
//  TopComics
//
//  Created by Jessica Lewinter on 24/10/18.
//  Copyright © 2018 Jessica Lewinter. All rights reserved.
//

import UIKit

class PeekAndPopViewController: UIViewController {

    @IBOutlet weak var imagePeek: UIImageView!
    
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePeek.image = image
        
        // Do any additional setup after loading the view.
    }
    
    override var previewActionItems: [UIPreviewActionItem] {
        let favoriteAction = UIPreviewAction(title: "Favorite", style: .default) { (action, viewController) in
            print("The user favorite the comic!")
        }
        
        let seePhotoAction = UIPreviewAction(title: "See Comic", style: .default) { (action, viewController) in
            print("The user see the comic!")
        }

        let deleteAction = UIPreviewAction(title: "Cancel", style: .destructive) { (action, viewController) -> Void in
            print("Cancel the action")
        }

        return [seePhotoAction, favoriteAction, deleteAction]
    }
    

}
