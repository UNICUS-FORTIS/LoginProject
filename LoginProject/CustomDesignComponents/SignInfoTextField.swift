//
//  GrayRectangleButton.swift
//  CustomViewPractice
//
//  Created by LOUIE MAC on 2023/08/24.
//

import UIKit


class SignInfoTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(placeHolder: String) {
        self.init()
        self.configureTextFieldAppearance(placeHolder: placeHolder)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureTextFieldAppearance(placeHolder: String) {
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white
        ]
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
        self.backgroundColor = .gray
        self.textAlignment = .center
        self.textColor = .white
        self.font = .boldSystemFont(ofSize: 14)
        
        
        attributedPlaceholder = NSAttributedString(string: placeHolder, attributes: placeholderAttributes)
    }
}
