//
//  HomeLayout.swift
//  VoyatekTest
//
//  Created by Bakare Waris on 22/02/2025.
//

import UIKit


final class HomeLayout: BaseView {
    
//    let categoryTableView = UITableView()
    let searchComponent = SearchComponent()
    let searchContainer = UIView()
   
    private lazy var customImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "User")
        view.contentMode = .scaleAspectFit
        view.constrainHeight(constant: 42)
        view.constrainWidth(constant: 42)
        return view
    }()
    
    private lazy var notificationImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Notification_icon")
        view.contentMode = .scaleAspectFit
        view.constrainHeight(constant: 42)
        view.constrainWidth(constant: 42)
        return view
    }()
    
    private lazy var titleLabel = UILabel(text: "Hey there, Lucy! ",
                                          font: .themeFont(fontStyle: .satoshiBold, size: .size14),
                             numberOfLines: 0,
                             color: .black,
                             alignment: .center)
    
   
    
    private lazy var descriptionLabel = UILabel(text: "Are you excited to create a tasty dish today?",
                                                font: .themeFont(fontStyle: .satoshiRegular, size: .size12),
                             numberOfLines: 0,
                             color: .black,
                             alignment: .center)
    
    lazy var allButton: UIButton = {
        let button = GeneralButton()
        button.setTitle("All", for: .normal)
        button.setFontSize(12)
        button.constrainHeight(constant: 40)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.05098039216, green: 0.431372549, blue: 0.9921568627, alpha: 1)
        return button
    }()
    
    lazy var morningFeastButton: UIButton = {
        let button = GeneralButton()
        button.setTitle("Morning Feast", for: .normal)
        button.setFontSize(12)
        button.constrainHeight(constant: 40)
        return button
    }()
    
    lazy var sunriseMealButton: UIButton = {
        let button = GeneralButton()
        button.setTitle("Sunrise Meal", for: .normal)
        button.setFontSize(12)
        button.constrainHeight(constant: 40)
        return button
    }()
    
    lazy var dawnDelicaciesButton: UIButton = {
        let button = GeneralButton()
        button.setTitle("Dawn Delicacies", for: .normal)
        button.setFontSize(12)
        button.constrainHeight(constant: 40)
        return button
    }()
    
    lazy var addImageView: UIImageView = {
           let iv = UIImageView()
           iv.image = UIImage(named: "pluscircle")
           iv.contentMode = .scaleAspectFit
           iv.translatesAutoresizingMaskIntoConstraints = false
           return iv
       }()
    
    lazy var addView: UIView = {
        let iv = UIView()
        iv.backgroundColor = .white
        iv.layer.cornerRadius = 21
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
       }()
    
    
    private lazy var hStackView = HorizontalStack(arrangedSubviews: [allButton, morningFeastButton, sunriseMealButton, dawnDelicaciesButton], spacing: 10)
    
    let foodTable = UITableView()
    
    override func setup() {
        super.setup()
        
        backgroundColor = .white
        
        foodTable.backgroundColor = .clear
        foodTable.showsVerticalScrollIndicator = false
        
        addSubviews(customImageView,
                    notificationImageView,
                    titleLabel,
                    descriptionLabel,
                    searchContainer,
                    hStackView,
                    foodTable,
                    addView
        )
        
        addView.addSubview(addImageView)
        
        setupSearchComponents()
        
        customImageView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 40, left: 20, bottom: 0, right: 0))
        
        notificationImageView.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 40, left: 0, bottom: 0, right: 20))
        
        titleLabel.anchor(top: customImageView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 20, left: 20, bottom: 0, right: 0))
        
        descriptionLabel.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 10, left: 20, bottom: 0, right: 0))
        
        searchContainer.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 40, left: 20, bottom: 0, right: 20), size: .init(width: 0, height: 58))
        
        searchContainer.addSubview(searchComponent)
        searchComponent.fillSuperview()
        
        hStackView.anchor(top: searchContainer.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 20, bottom: 0, right: 20))
        
        foodTable.anchor(top: hStackView.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
        
        addView.anchor(top: notificationImageView.bottomAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 20) ,size: .init(width: 42, height: 42))
        
        addImageView.anchor(top: addView.topAnchor, leading: addView.leadingAnchor, bottom: addView.bottomAnchor, trailing: addView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        

    }
    
    fileprivate func setupSearchComponents() {
        searchContainer.layer.borderWidth = 1.0
        searchContainer.layer.cornerRadius = 10
        searchContainer.layer.borderColor = UIColor.clear.cgColor
        searchComponent.clipsToBounds = true
        searchComponent.layer.cornerRadius = 10
        searchComponent.backgroundColor = UIColor(red: 0.97, green: 0.98, blue: 0.99, alpha: 1.00)
        searchComponent.setupPlaceHolder(with: "Search for category")
    }
    
    @objc private func didTapAll() {
        print("All button tapped")
        // Filter your data or do something else
    }
    
    @objc private func didTapMorningFeast() {
        print("Morning Feast button tapped")
        // ...
    }
    
    @objc private func didTapSunriseMeal() {
        print("Sunrise Meal button tapped")
        // ...
    }
    
    @objc private func didTapDawnDelicacies() {
        print("Dawn Delicacies button tapped")
        // ...
    }
    
}

