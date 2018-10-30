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
    var window: UIWindow?
    
    weak var delegate: AlertDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePeek.image = image
        window?.rootViewController = PeekAndPopViewController()
        
    }
    
    override var previewActionItems: [UIPreviewActionItem] {
        let favoriteAction = UIPreviewAction(title: "Favorite Comic", style: .default) { (action, viewController) in
            print("The user favorite the comic!")

            self.delegate?.showAlert()
        }
        
        
        let seePhotoAction = UIPreviewAction(title: "View Comic", style: .default) { (action, viewController) in
            print("The user see the comic!")
        }

        let deleteAction = UIPreviewAction(title: "Cancel", style: .destructive) { (action, viewController) -> Void in
            print("Cancel the action")
        }

        return [favoriteAction, seePhotoAction, deleteAction]
    }
    

}
