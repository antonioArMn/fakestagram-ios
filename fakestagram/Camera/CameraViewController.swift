//
//  CameraViewController.swift
//  fakestagram
//
//  Created by José Antonio Arellano Mendoza on 5/2/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var selectImageButton: UIButton!
    @IBOutlet weak var postButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    
    //Properties
    var imagePicker: ImagePicker!
    var imageSelected = UIImage()
    var imageSelected64: String = ""
    let client = CreatePostClient()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Title
        navigationItem.title = "Post Image"
        
        //Constraints
        imageView.backgroundColor = .gray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.40).isActive = true
        
        //textView.backgroundColor = .red
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8).isActive = true
        textField.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        textField.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        //textField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        selectImageButton.translatesAutoresizingMaskIntoConstraints = false
        selectImageButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        
        postButton.translatesAutoresizingMaskIntoConstraints = false
        postButton.bottomAnchor.constraint(equalTo: selectImageButton.topAnchor, constant: -30).isActive = true
        
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)

        // Do any additional setup after loading the view.
    }
    
    //This action should be deleted, also button on storyboard (Post!)
    @IBAction func onTapSnap(_ sender: UIButton) {
        print("POOOOST")
        //guard let img = UIImage(named: "leopardoNieve"), let imgBase64 = img.encodedBase64() else { return }
        //let payload = CreatePostBase64(title: "Leopardo nieve - \(Date().currentTimestamp())", imageData: imgBase64)
        let payload = CreatePostBase64(title: "\(textField.text!)", imageData: self.imageSelected64)
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
    
    //New button and action Load Photo
    @IBAction func showImagePicker(_ sender: UIButton) {
        self.imagePicker.present(from: sender)
    }
    

}

extension CameraViewController: ImagePickerDelegate {
    
    func didSelect(image: UIImage?) {
        self.imageView.image = image
        self.imageSelected = image!
        self.imageSelected64 = self.imageSelected.encodedBase64()!
    }
}
