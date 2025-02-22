//
//  HorizontalStackView.swift
//  VoyatekTest
//
//  Created by Bakare Waris on 22/02/2025.
//

import Foundation
import UIKit

final class HorizontalStack: UIStackView {
    
    public init(arrangedSubviews: [UIView], spacing: CGFloat = 0, distribution: UIStackView.Distribution = .fill, alignment: UIStackView.Alignment = .fill) {
        super.init(frame: .zero)
        arrangedSubviews.forEach({addArrangedSubview($0)})
        self.spacing = spacing
        self.axis = .horizontal
        self.distribution = distribution
        self.alignment = alignment
    }
    
    public required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
