//
//  ViewController.swift
//  CameraApp
//
//  Created by Ebtesam Alahmari on 02/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    let img = UIImageView(frame: CGRect(x: 100 , y: 100, width: 200, height: 200))
    let usernameTxt = UITextField(frame: CGRect(x: 50, y: 360, width: 300, height: 40))
    let passwordTxt = UITextField(frame: CGRect(x: 50, y: 420, width: 300, height: 40))
    let signInBtn = UIButton(frame: CGRect(x: 50 , y: 490, width: 300, height: 40))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //UIImageView
        img.image = UIImage(named: "img")
        img.contentMode = .scaleAspectFill
        view.addSubview(img)
        //UITextField 1
        usernameTxt.placeholder = "Enter username"
        usernameTxt.borderStyle = .roundedRect
        view.addSubview(usernameTxt)
        //UITextField 2
        passwordTxt.placeholder = "Enter password"
        passwordTxt.isSecureTextEntry = true
        passwordTxt.borderStyle = .roundedRect
        view.addSubview(passwordTxt)
        //UIButton
        signInBtn.backgroundColor = #colorLiteral(red: 0.4186542928, green: 0.414215982, blue: 0.7267787457, alpha: 1)
        signInBtn.setTitle("SignIn", for: .normal)
        signInBtn.setTitleColor(.white, for: .normal)
        signInBtn.layer.cornerRadius = 15
        signInBtn.addTarget(self, action: #selector(signIn), for: .touchDown)
        view.addSubview(signInBtn)
        
    }
    
    @objc func signIn() {
        if usernameTxt.text != "" && passwordTxt.text != "" {
            if passwordTxt.text!.count > 7 {
                let vc = SecondViewController()
                vc.username = usernameTxt.text!
                present(vc, animated: true, completion: nil)
            }else {
                let alert = UIAlertController(title: "Alert", message: "Invalid password, must be more than 7 digit", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
            }
        }else {
            let alert = UIAlertController(title: "Alert", message: "Missing Information", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    
}

extension UIViewController {
    func  prefersStatusBarHidden() -> Bool {
        return false
    }
}
