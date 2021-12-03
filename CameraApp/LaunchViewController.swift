//
//  LaunchViewController.swift
//  CameraApp
//
//  Created by Ebtesam Alahmari on 02/12/2021.
//

import UIKit

class LaunchViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        createTimer()
    }
    
    func createTimer() {
        var isAnimated = false
        let img = UIImageView(frame: CGRect(x: 0 , y: 0, width: 200, height: 200))
        img.image = UIImage(named: "img")
        img.contentMode = .scaleAspectFill
        view.addSubview(img)
        img.center = view.center
        let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
            guard let strongSelf = self else{return}
            DispatchQueue.main.async {
                if isAnimated {
                    UIView.animate(withDuration: 1) {
                        img.frame = CGRect(x: 0 , y: 0, width: 400, height: 400)
                        img.center = strongSelf.view.center
                    }
                    isAnimated = false
                }else {
                    UIView.animate(withDuration: 1) {
                        img.frame = CGRect(x: 0 , y: 0, width: 200, height: 200)
                        img.center = strongSelf.view.center
                    }
                    isAnimated = true
                }
            }
        }
    }
}
