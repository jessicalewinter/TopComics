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
    var fileManager = FileManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePeek.image = image
        window?.rootViewController = PeekAndPopViewController()
        
    }
    func saveImage(image: UIImage, fileName: String){
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(fileName)
        let stringPath = imagePath as String
        
        let data = image.jpegData(compressionQuality: 1.0)
        fileManager.createFile(atPath: stringPath, contents: data, attributes: nil)
        print(imagePath)
    }
    
    override var previewActionItems: [UIPreviewActionItem] {
        let favoriteAction = UIPreviewAction(title: "Favorite Comic", style: .default) { (action, viewController) in
            print("The user favorite the comic!")
            
            self.saveImage(image: self.imagePeek.image!, fileName: String())
            
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
