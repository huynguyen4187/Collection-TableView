//
//  AddingViewController.swift
//  UICollectionView
//
//  Created by Nguyen Hoang Huy on 5/22/19.
//  Copyright © 2019 Nguyen Hoang Huy. All rights reserved.
//

import UIKit

protocol AddingProtocol {
    func insertvideo(model:Image)
    func delete(index:Int)
}

class AddingViewController: UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var myNameImage: UITextField!
    @IBOutlet weak var myNameChanel: UITextField!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myStatus: UIButton!
    @IBOutlet weak var Update: UIButton!
    
    var status:String = ""
    let videopicker = UIImagePickerController()
    var delegate:AddingProtocol!
    var updateObject:Image?
    var index:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        videopicker.delegate = self
        myImage.isUserInteractionEnabled=true
        let TapGesture = UITapGestureRecognizer(target: self, action: #selector(Tapped(_:)))
        self.myImage.addGestureRecognizer(TapGesture)
        
        if let updateNew = updateObject{
            myImage.image = UIImage(data: updateNew.img!)
            myNameImage.text = updateNew.nameImage
            myNameChanel.text = updateNew.nameChanel
            myStatus.isSelected = updateNew.status
            Update.setTitle("Delete", for: .normal)
        }else{
            Update.setTitle("Adding", for: .normal)
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        myNameChanel.resignFirstResponder()
        myNameImage.resignFirstResponder()
    }
    
    @IBAction func Tapped(_ sender: UITapGestureRecognizer) {
        
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                self.videopicker.sourceType = .camera
                self.present(self.videopicker, animated: true, completion: nil)
            }else{
                print("Camera not available")
            }
        }))
        actionSheet.addAction(UIAlertAction(title: "PhotoLibrary", style: .default, handler: { (UIAlertAction) in
            self.videopicker.sourceType = .photoLibrary
            self.present(self.videopicker, animated: true, completion: nil)
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        
        videopicker.allowsEditing = true
        present(actionSheet, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            myImage.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func activityStatus(_ sender: Any) {
        let btn = sender as! UIButton
        btn.isSelected = !btn.isSelected
        if btn.isSelected{
          status = "Đã đăng ký"
        }
        else{
            status = "Chưa đăng ký"
        }
    }
    
    @IBAction func DoneAdding(_ sender: Any) {
//        myImage.image!.jpegData(compressionQuality: 0.9)!
        if let updateNew = updateObject{
            updateNew.nameChanel = myNameChanel.text ?? ""
            updateNew.nameImage = myNameChanel.text ?? ""
            updateNew.img = myImage?.image!.jpegData(compressionQuality: 0.9)!
            if myStatus.isSelected{
                status = "Đã đăng ký"
            }else{
                status = "Chưa đăng ký"
            }
            updateNew.status = myStatus.isSelected
            delegate.delete(index: index)
            self.navigationController?.popViewController(animated: true)
        }
        else{
            let img = myImage.image!.jpegData(compressionQuality: 0.9)!
            let detailimage = Image(nameImage: myNameImage.text!, nameChanel: myNameChanel.text!, status: myStatus.isSelected, img: img )
            delegate.insertvideo(model: detailimage)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}
