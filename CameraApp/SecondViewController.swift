//
//  SecondViewController.swift
//  CameraApp
//
//  Created by Ebtesam Alahmari on 02/12/2021.
//

import UIKit

class SecondViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    var username = ""
    let usernameLable = UILabel(frame: CGRect(x: 50, y: 100, width: 300, height: 40))
    let userImage = UIImageView(frame: CGRect(x: 0, y: 160, width: 400, height: 400))
    let uploadBtn = UIButton(frame: CGRect(x: 50 , y: 600, width: 300, height: 40))
    let cameraView = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cameraView.delegate = self
        view.backgroundColor = .white
        //UILabel
        usernameLable.text = username + "'s" + " Photo"
        usernameLable.textColor = #colorLiteral(red: 0.4186542928, green: 0.414215982, blue: 0.7267787457, alpha: 1)
        usernameLable.textAlignment = .center
        usernameLable.font = UIFont.boldSystemFont(ofSize: 30)
        usernameLable.font.withSize(40)
        usernameLable.adjustsFontSizeToFitWidth = true
        view.addSubview(usernameLable)
        //UIImageView
        userImage.image = UIImage(named: "Image")
        userImage.contentMode = .scaleAspectFill
        userImage.clipsToBounds = true
        view.addSubview(userImage)
        //UIButton
        uploadBtn.backgroundColor = #colorLiteral(red: 0.4186542928, green: 0.414215982, blue: 0.7267787457, alpha: 1)
        uploadBtn.setTitle("Take a Picture!", for: .normal)
        uploadBtn.setTitleColor(.white, for: .normal)
        uploadBtn.layer.cornerRadius = 15
        uploadBtn.addTarget(self, action: #selector(takePicture), for: .touchDown)
        view.addSubview(uploadBtn)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        userImage.image = pickedImage
        picker.dismiss(animated: true, completion: nil)
    }
    
    @objc func takePicture() {
        cameraView.sourceType = .camera
        present(cameraView, animated: true, completion: nil)
    }
}
