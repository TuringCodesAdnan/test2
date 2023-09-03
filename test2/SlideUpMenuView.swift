//
//  SlideUpMenu.swift
//  test2
//
//  Created by Mustafa Adnan Tatlıcı on 3.09.2023.
//

import UIKit

class SlideUpMenuView: UIView {
    
     let signUpLabel = UILabel()
     let signInLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupButtons()
        setupLabels()
       var isHidden: Bool = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
        setupButtons()
        setupLabels()
        
    }
    
    
    private func setupView() {
        backgroundColor = UIColor.white
        
    }
    
    private func setupButtons() {
        let closeButton = UIButton(type: .system)
              closeButton.setTitle("X", for: .normal)
              closeButton.setTitleColor(.white, for: .normal)
              closeButton.frame = CGRect(x: frame.width - 40, y: 20, width: 30, height: -20)
              closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
              closeButton.layer.cornerRadius = closeButton.frame.width / 2
              addSubview(closeButton)
        
        
        let button1 = UIButton(type: .system)
        button1.setTitle("Continue With Facebook", for: .normal)
        button1.frame = CGRect(x: 20, y: 60, width: frame.width - 40, height: 50)
        button1.addTarget(self, action: #selector(button1Tapped), for: .touchUpInside)
        button1.backgroundColor = #colorLiteral(red: 0.1176470444, green: 0.1176470444, blue: 0.1176470444, alpha: 1)
        button1.layer.cornerRadius = 5
        button1.setTitleColor(.white, for: .normal)
        button1.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button1.layer.borderWidth = 1.0
        button1.layer.borderColor = UIColor.white.cgColor
        addSubview(button1)
        
        let button2 = UIButton(type: .system)
        button2.setTitle("Continue With Google", for: .normal)
        button2.frame = CGRect(x: 20, y: 120, width: frame.width - 40, height: 50)
        button2.addTarget(self, action: #selector(button2Tapped), for: .touchUpInside)
        button2.backgroundColor = #colorLiteral(red: 0.1176470444, green: 0.1176470444, blue: 0.1176470444, alpha: 1)
        button2.layer.cornerRadius = 5
        button2.setTitleColor(.white, for: .normal)
        button2.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button2.layer.borderWidth = 1.0
        button2.layer.borderColor = UIColor.white.cgColor
        addSubview(button2)
        
        let button3 = UIButton(type: .system)
        button3.setTitle("Continue With Apple", for: .normal)
        button3.frame = CGRect(x: 20, y: 180, width: frame.width - 40, height: 50)
        button3.addTarget(self, action: #selector(button3Tapped), for: .touchUpInside)
        button3.backgroundColor = #colorLiteral(red: 0.1176470444, green: 0.1176470444, blue: 0.1176470444, alpha: 1)
        button3.layer.cornerRadius = 5
        button3.setTitleColor(.white, for: .normal)
        button3.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button3.layer.borderWidth = 1.0
        button3.layer.borderColor = UIColor.white.cgColor
        addSubview(button3)
        
        let emailLabel = UILabel()
            emailLabel.text = "Or continue with email"
            emailLabel.frame = CGRect(x: 20, y: button3.frame.maxY + 20, width: frame.width - 40, height: 20)
            emailLabel.textAlignment = .center
            emailLabel.textColor = .white
            emailLabel.isUserInteractionEnabled = true
            let emailTapGesture = UITapGestureRecognizer(target: self, action: #selector(emailLabelTapped))
            emailLabel.addGestureRecognizer(emailTapGesture)
            addSubview(emailLabel)
        
        let topSeparatorLine = createTopSeparatorLine()
        topSeparatorLine.frame = CGRect(x: 0, y: signInLabel.frame.maxY + 40, width: frame.width, height: 1)
        addSubview(topSeparatorLine)
    }
    

    
    private func setupLabels() {
         signUpLabel.text = "Sign Up"
         signUpLabel.frame = CGRect(x: 20, y: 0, width: frame.width - 40, height: 20)
         signUpLabel.textAlignment = .center
         signUpLabel.textColor = .white
         addSubview(signUpLabel)

         signInLabel.text = "Sign In"
         signInLabel.frame = CGRect(x: 20, y: 50, width: frame.width - 40, height: 20)
         signInLabel.textAlignment = .center
         signInLabel.textColor = .white
     }
     
     func setLabelText(_ text: String) {
         signUpLabel.text = text
         signInLabel.text = text
     }
     
    func createTopSeparatorLine() -> UIView {
        let line = UIView()
        line.backgroundColor = .darkGray
        return line
    }

    @objc func emailLabelTapped() {
        print("Continue with email tapped")
    }

    
    @objc func closeButtonTapped() {
        isHidden = true
        removeFromSuperview()
  
    }
    
    @objc func button1Tapped() {
        print("Continue With Facebook tapped")
    }
    
    @objc func button2Tapped() {
        print("Continue With Google tapped")
    }
    
    @objc func button3Tapped() {
        print("Continue With Apple tapped")
    }
}
