//
//  BaseView.swift
//  VoyatekTest
//
//  Created by Bakare Waris on 22/02/2025.
//

import UIKit

open class BaseView: UIView {
    
    open func setup() {
        backgroundColor = .white
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
