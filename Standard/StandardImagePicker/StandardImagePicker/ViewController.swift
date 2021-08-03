//
//  ViewController.swift
//  StandardImagePicker
//
//  Created by 윤재필 on 2021/08/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.delegate = self
    }

    @IBAction func addAction(_ sender: UIButton) {
        
        let alter = UIAlertController(title: "제목", message: "메시지", preferredStyle: .actionSheet)
        
        let gallery = UIAlertAction(title: "사진앨범", style: .default, handler: {ACTION in self.openGallery()})
        
        let camera = UIAlertAction(title: "카메라", style: .default, handler: {ACTION in self.openCamera()})
        
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alter.addAction(gallery)
        alter.addAction(camera)
        alter.addAction(cancel)
        
        present(alter, animated: true, completion: nil)
    }
    
    func openGallery(){
        picker.sourceType = .photoLibrary
        present(picker, animated: false, completion: nil)
    }
    
    func openCamera(){
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("Camera is not available")
            return
        }
        picker.sourceType = .camera
        present(picker, animated: false, completion: nil)
    }
    
}
/*
 UIImagePickerControllerDelegate의 delegate 속성은 UIImagePickerControllerDelegate와 UINavigationControllerDelegate 프로토콜을 모두 구현하는 객체로 정의되어있다.
 (위에서 해준 picker.delegate =  self) self를  picker.delegate에 할당하려면 self는 UINavigationControllerDelegate 타입이어야 한다.
 
 ***Swift 컨벤션에 따르면, 이런 Delegate채택작업은 extension으로 빼는게 좋다***
*/
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imageView.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    
}
