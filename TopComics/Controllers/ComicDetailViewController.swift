//
//  ComicDetailViewController.swift
//  TopComics
//
//  Created by Jessica Lewinter on 24/10/18.
//  Copyright © 2018 Jessica Lewinter. All rights reserved.
//

import UIKit

class ComicDetailViewController: UIViewController {

    @IBOutlet weak var bookDetailView: ComicDetailHeader!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookDetailView.bookLabel.text = "hello"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
