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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePeek.image = image
        window?.rootViewController = PeekAndPopViewController()
        
        // Do any additional setup after loading the view.
    }
    
    override var previewActionItems: [UIPreviewActionItem] {
        let favoriteAction = UIPreviewAction(title: "Favorite Comic", style: .default) { (action, viewController) in
            print("The user favorite the comic!")
            let firstAlert = UIAlertController(title: "Alert", message: "Book has been added to your Favorite's List", preferredStyle: .alert)
            let firstAlertCancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            let firstAlertSaveButton = UIAlertAction(title: "Save", style: .default, handler: { (action) in

            })

            firstAlert.addAction(firstAlertCancelButton)
            firstAlert.addAction(firstAlertSaveButton)
            
            self.window?.rootViewController?.present(firstAlert, animated: true)
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
