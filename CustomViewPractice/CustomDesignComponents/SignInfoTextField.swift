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
    
    
    
    
    
    
//    func configureUI(title: String, imageTitle: String) {
//        var configuration = UIButton.Configuration.bordered()
//        var attString = AttributedString(String(describing: title))
//        attString.font = .boldSystemFont(ofSize: 17)
//        attString.foregroundColor = .black
//        configuration.attributedTitle = attString
//        configuration.image = UIImage(named: String(describing: imageTitle))
//        configuration.imagePadding = 20
//        configuration.preferredSymbolConfigurationForImage = .init(pointSize: 5)
//        configuration.imagePlacement = .leading
//        configuration.baseBackgroundColor = .white
//        configuration.background.strokeColor = .lightGray
//        configuration.background.strokeWidth = 1
//        configuration.cornerStyle = .dynamic
//        configuration.contentInsets = .init(top: 20, leading: 10, bottom: 20, trailing: 60)
//
//        self.configuration = configuration
//    }
    
    
    
}
