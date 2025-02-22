//
//  GeneralButton.swift
//  VoyatekTest
//
//  Created by Bakare Waris on 22/02/2025.
//

import UIKit

class GeneralButton: UIButton {
    private let satoshiFontName = "Satoshi-Regular"
    private let defaultFontSize: CGFloat = 14
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAppearance()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupAppearance()
    }
    
    private func setupAppearance() {
        self.backgroundColor = UIColor(
            red: 249.0/255.0,
            green: 250.0/255.0,
            blue: 251.0/255.0,
            alpha: 1.0
        )
        
        self.setTitleColor(
            UIColor(
                red: 103.0/255.0,
                green: 110.0/255.0,
                blue: 126.0/255.0,
                alpha: 1.0
            ),
            for: .normal
        )
        
        self.titleLabel?.font = UIFont(name: satoshiFontName, size: defaultFontSize)
            ?? UIFont.systemFont(ofSize: defaultFontSize)
        
        self.layer.cornerRadius = 4

    }
    
    func setFontSize(_ size: CGFloat) {
        self.titleLabel?.font = UIFont(name: satoshiFontName, size: size)
            ?? UIFont.systemFont(ofSize: size)
    }
}

