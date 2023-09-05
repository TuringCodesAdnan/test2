//
//  LoginViewController.swift
//  test2
//
//  Created by Mustafa Adnan Tatlıcı on 5.09.2023.
//

import UIKit



class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgottenPassword: UIButton!
    @IBOutlet weak var havingTrouble: UIButton!
    @IBOutlet weak var eyeButton: UIButton!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Log in"
        
        label1.isHidden = true
        label2.isHidden = true
        

        let initialEyeIconName = passwordTF.isSecureTextEntry ? "eye.slash.circle" : "eye.circle"
            if let initialEyeImage = UIImage(systemName: initialEyeIconName) {
                eyeButton.setImage(initialEyeImage, for: .normal) }
        
        
        usernameTF.borderStyle = .none
        passwordTF.borderStyle = .none
           
        addBottomBorder(to: usernameTF)
        addBottomBorder(to: passwordTF)
        
        
        
        let titleColor = UIColor.white
        if let navigationController = self.navigationController {
        navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: titleColor]
            
            if let backButtonImage = UIImage(systemName: "arrow.backward")?.withTintColor(UIColor.white, renderingMode: .alwaysOriginal) {
                let backButton = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(goBack))
                navigationController.topViewController?.navigationItem.leftBarButtonItem = backButton
            }

        
        loginButton.layer.cornerRadius = 5
        

        let attributes: [NSAttributedString.Key: Any] = [ .underlineStyle: NSUnderlineStyle.single.rawValue ]
        let forgottenPasswordText = NSAttributedString(string: "Forgotten Password?", attributes: attributes)
        forgottenPassword.setAttributedTitle(forgottenPasswordText, for: .normal)
               
        let havingTroubleText = NSAttributedString(string: "Having Trouble", attributes: attributes)
        havingTrouble.setAttributedTitle(havingTroubleText, for: .normal)
        
        
        } }
    
       @objc func goBack() {
                navigationController?.popViewController(animated: true)
    }

         func addBottomBorder(to textField: UITextField) {
            let bottomLine = CALayer()
            bottomLine.frame = CGRect(x: 0.0, y: textField.frame.size.height - 1, width: textField.frame.size.width, height: 1.0)
            bottomLine.backgroundColor = #colorLiteral(red: 0.1843137443, green: 0.1843137443, blue: 0.1843137443, alpha: 1)
            textField.borderStyle = .none
            textField.layer.addSublayer(bottomLine)
 }
    

    
    @IBAction func loginButtonTapped(_ sender: Any) {
        if usernameTF.text?.isEmpty ?? true || passwordTF.text?.isEmpty ?? true {

                label1.isHidden = false
                label2.isHidden = false
            } else {
                
                print("login button tapped")
            }
        
    }
    
    
    @IBAction func forgottenPasswordButtonTapped(_ sender: Any) {
        print("forgotten password button tapped")
    }
    
    
    @IBAction func havingTroubleButtonTapped(_ sender: Any) {
      print("having trouble button tapped")
    }
    
    
    @IBAction func eyeButtonTapped(_ sender: Any) {
           passwordTF.isSecureTextEntry.toggle()
           let eyeIconName = passwordTF.isSecureTextEntry ? "eye.slash.circle" : "eye.circle"
           if let eyeImage = UIImage(systemName: eyeIconName) {
               eyeButton.setImage(eyeImage, for: .normal)
           }    }
}
