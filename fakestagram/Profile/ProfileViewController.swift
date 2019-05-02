//
//  ProfileViewController.swift
//  fakestagram
//
//  Created by José Antonio Arellano Mendoza on 4/26/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var authorView: PostAuthorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authorView.author = Author(id: "213", name: "jojo")
    }
}
