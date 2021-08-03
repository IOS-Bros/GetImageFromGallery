//
//  ViewController.swift
//  StandardImagePicker
//
//  Created by 윤재필 on 2021/08/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addAction(_ sender: UIButton) {
        
        let alter = UIAlertController(title: "제목", message: "메시지", preferredStyle: .actionSheet)
        
        let gallery = UIAlertAction(title: "사진앨범", style: .default, handler: {ACTIN in in self.openLibrary()})
        
        let camera = UIAlertAction(title: "카메라", style: .default, handler: ACTION in self.openCamera())
        
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alter.addAction(gallery)
        alter.addAction(camera)
        alter.addAction(cancel)
        
        present(alter, animated: true, completion: nil)
    }
    
}

