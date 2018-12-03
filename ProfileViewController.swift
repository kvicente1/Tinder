//
//  ProfileViewController.swift
//  Tinder
//
//  Created by Felipe De La Torre on 11/22/18.
//  Copyright © 2018 Felipe De La Torre. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var fullPicture: UIImageView!
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullPicture.image = image

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onDone(_ sender: Any) {
         dismiss(animated: true, completion: nil)
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
