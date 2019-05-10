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
    
    //This action should be deleted, also button on storyboard (Post!)
    @IBAction func onTapSnap(_ sender: UIButton) {
        print("POOOOST")
        guard let img = UIImage(named: "leopardoNieve"), let imgBase64 = img.encodedBase64() else { return }
        let payload = CreatePostBase64(title: "Leopardo nieve - \(Date().currentTimestamp())", imageData: imgBase64)
        client.create(payload: payload) { post in
            print(post)
        }
    }
    
    func createPost(img: UIImage) {
        guard let imgBase64 = img.encodedBase64() else { return }
        let timestamp = Date().currentTimestamp()
        client.create(title: String(timestamp), imageData: imgBase64) { post in
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
