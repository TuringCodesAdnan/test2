//
//  ViewController.swift
//  test2
//
//  Created by Mustafa Adnan Tatlıcı on 3.09.2023.
//

import UIKit

class ViewController: UIViewController {
    var slideUpMenu: SlideUpMenuView?
    
    @IBOutlet weak var signInButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1176470444, green: 0.1176470444, blue: 0.1176470444, alpha: 1)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)

        signInButton.layer.borderWidth = 1.0
        signInButton.layer.borderColor = #colorLiteral(red: 0.3630581498, green: 0.6061462164, blue: 0.6582814455, alpha: 1)
        
        for imageView in imageView {
            imageView.image = UIImage(named: "kiyafet")
        }
    }

    @IBAction func signUpButtonTapped(_ sender: Any) {
        showSlideUpMenu(with: "Sign Up")
    }
    
    @IBAction func signInButtonTapped(_ sender: Any) {
        showSlideUpMenu(with: "Sign In")
    }
    
    @IBAction func skipButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "toHome", sender: nil)

    }

    @IBOutlet var imageView: [UIImageView]!
    
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        hideSlideUpMenu()
    }
    

    
    func showSlideUpMenu(with labelText: String) {
        if slideUpMenu == nil || slideUpMenu?.isHidden == true {
            slideUpMenu = SlideUpMenuView(frame: CGRect(x: 0, y: view.frame.height - 300, width: view.frame.width, height: 300))
            view.addSubview(slideUpMenu!)
            slideUpMenu?.isHidden = false
        }
        slideUpMenu?.backgroundColor = #colorLiteral(red: 0.1176470444, green: 0.1176470444, blue: 0.1176470444, alpha: 1)
        slideUpMenu?.setLabelText(labelText)

        UIView.animate(withDuration: 0.5) {
            self.slideUpMenu?.frame.origin.y = self.view.frame.height - 300
        }
    }

    
    func hideSlideUpMenu() {
        UIView.animate(withDuration: 0.3, animations: {
            self.slideUpMenu?.frame.origin.y = self.view.frame.height
        }) { (_) in
            self.slideUpMenu?.removeFromSuperview()
            self.slideUpMenu = nil
        }
    }
    
}
