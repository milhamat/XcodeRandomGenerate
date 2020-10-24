//
//  AddPhotoViewController.swift
//  TitikJumpa
//
//  Created by Ihwan ID on 10/08/20.
//  Copyright © 2020 WE4US. All rights reserved.
//

import UIKit

class AddExperienceViewController: UIViewController, UINavigationControllerDelegate,  UIImagePickerControllerDelegate {
    
    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var descriptionField: UITextView!
    
    @IBOutlet weak var image: UIImageView!
    var imageData: UIImage?
    var url: URL?
    var isImageEmpty: Bool = true
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        image.addGestureRecognizer(tapGesture)
        // make sure imageView can be interacted with by user
        image.isUserInteractionEnabled = true
        
    }
    
    @IBAction func onNextTapped(_ sender: Any) {

        if(titleField.text?.isEmpty == true){
            alertMsg(msg: "title")
        }
        if(descriptionField.text.isEmpty == true){
            alertMsg(msg: "story")
        }
        if(isImageEmpty){
            alertMsg(msg: "Image's Story")
        }
        if(!isImageEmpty && titleField.text?.isEmpty == false && descriptionField.text.isEmpty == false){
             performSegue(withIdentifier: "toPreview", sender: "")
        }
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPreview" {
            let previewViewController = segue.destination as! PreviewExperienceViewController
            previewViewController.image = self.imageData
            previewViewController.desc = descriptionField.text
            previewViewController.name = titleField.text
            previewViewController.imageUrl = url
        }
    }
    
    @objc func imageTapped() {
        
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let url = info[UIImagePickerController.InfoKey.imageURL] as? URL{
            self.url = url
        }
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.image.image = image
            self.imageData = image
        }
        self.isImageEmpty = false
        
    }
    
    func alertMsg(msg: String){
        let alert = UIAlertController(title: "Empty Field!", message: "Please fill up your \(msg)", preferredStyle: .alert)
                  alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                      //action
                  }))
                  self.present(alert, animated: true)
    }
}
