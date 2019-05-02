//
//  CameraViewController.swift
//  fakestagram
//
//  Created by José Antonio Arellano Mendoza on 5/2/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController {
    let client = CreatePostClient()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTapSnap(_ sender: UIButton) {
        guard let img = UIImage(named: "diosMexica"), let imgBase64 = img.encodedBase64() else { return }
        let payload = CreatePostBase64(title: "diosMexica - \(Date().currentTimestamp())", imageData: imgBase64)
        client.create(payload: payload) { post in
            print(post)
        }
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
