//
//  PasswordTF.swift
//  test2
//
//  Created by Mustafa Adnan Tatlıcı on 5.09.2023.
//

import UIKit



class PasswordTextField: UITextField {
    
    
    
    let showHideButton = UIButton(type: .custom)
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Şifre göster/gizle düğmesini ayarla
        showHideButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        showHideButton.setImage(UIImage(systemName: "eye"), for: .selected)
        showHideButton.contentMode = .center
        showHideButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        showHideButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        rightView = showHideButton
        rightViewMode = .always
        
        // Şifre girişinin sağ tarafına bir boşluk ekleyin
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        leftView = paddingView
        leftViewMode = .always
        
        // Şifreyi gizle başlangıçta
        isSecureTextEntry = true
    }
    
    @objc func togglePasswordVisibility() {
        // Şifre gizleme durumunu tersine çevir
        isSecureTextEntry.toggle()
        showHideButton.isSelected = !isSecureTextEntry
    }
}
