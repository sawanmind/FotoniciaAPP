//
//  PhotoSelectionViewController.swift
//  FotoniciaAPP
//
//  Created by Asheesh Verma on 15/06/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import UIKit
import Photos
import AVKit
import DKImagePickerController

class PhotoSelectionViewController: UIViewController {
    let pickerController = DKImagePickerController()
    var cameraImagePicker: UIImagePickerController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        cameraImagePicker =  UIImagePickerController()
        cameraImagePicker?.delegate = self
        cameraImagePicker?.sourceType = (UIImagePickerController .isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)) ? .camera : .photoLibrary
        
        
        self.showLeftBarButtonItemWithImage()
        
        
        
        /// The maximum count of assets which the user will be able to select.
        pickerController.maxSelectableCount = 12
        // Do any additional setup after loading the view.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnTakePictureAction(_ sender: UIButton) {
        self.openCamera()
    }
    func openCamera() {
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerControllerSourceType.camera))
        {
            cameraImagePicker?.sourceType = UIImagePickerControllerSourceType.camera
            cameraImagePicker?.allowsEditing = true
            self.present(cameraImagePicker!, animated: true, completion: nil)
        }
        else
        {
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera. Simulator doesn't have camera. Use Device to test camera functionality.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func btnGalleryAction(_ sender: UIButton) {
        
        pickerController.didSelectAssets = { (assets: [DKAsset]) in
            print("didSelectAssets")
            print(assets)
        }
        self.present(pickerController, animated: true) {}
    }
}

extension PhotoSelectionViewController : UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            // Use editedImage Here
        } else if let originalImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            // Use originalImage Here
        }
        picker.dismiss(animated: true)
    }
}
