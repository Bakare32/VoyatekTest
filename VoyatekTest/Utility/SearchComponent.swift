//
//  SearchComponent.swift
//  VoyatekTest
//
//  Created by Bakare Waris on 22/02/2025.
//

import UIKit

final class SearchComponent: BaseView {
    
    let searchImageView: UIImageView = {
       let view = UIImageView()
       view.image = UIImage(named: "searchIcon")
       view.contentMode = .scaleAspectFit
       return view
    }()
    
    let searchTextField = UITextField()
    
    override func setup() {
        super.setup()
        backgroundColor = .white
        searchTextField.placeholder = "Search for product"
        searchTextField.borderStyle = .none
        searchTextField.constrainHeight(constant: 44)
        searchTextField.backgroundColor = .clear
        searchImageView.constrainHeight(constant: 16)
        searchImageView.constrainWidth(constant: 16)
        let stack = HorizontalStack(arrangedSubviews: [searchImageView, searchTextField], spacing: 10, distribution: .fill, alignment: .center)
        addSubviews(stack)
        searchTextField.font = .themeFont(fontStyle: .regular, size: .size14)
        stack.fillSuperview(padding: .init(top: 0, left: 10, bottom: 0, right: 0))
    }
    
    func setupPlaceHolder(with title: String) {
        searchTextField.attributedPlaceholder = NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.62, green: 0.62, blue: 0.63, alpha: 1.00)])
    }
}
