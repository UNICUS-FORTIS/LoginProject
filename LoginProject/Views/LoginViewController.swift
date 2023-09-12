//
//  ViewController.swift
//  CustomViewPractice
//
//  Created by LOUIE MAC on 2023/08/24.
//

import UIKit
import SnapKit

final class LoginViewController: UIViewController {
    
    let viewModel = LoginViewModel()
    
    let titleLabel:UILabel = {
        let label = UILabel()
        label.text = "JJAPFLIX"
        label.textColor = .red
        label.font = .boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        return label
    }()
    
    let idTextField = SignInfoTextField(placeHolder: SignInCategory.idTextField)
    let pwTextField = SignInfoTextField(placeHolder: SignInCategory.pwTextField)
    let nickNameTextField = SignInfoTextField(placeHolder: SignInCategory.nickName)
    let locationTextField = SignInfoTextField(placeHolder: SignInCategory.location)
    let recommandTextField = SignInfoTextField(placeHolder: SignInCategory.recommanded)
    
    let signInButton:UIButton = {
        let btn = UIButton()
        btn.setTitle("회원가입", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .black
        btn.titleLabel?.font = .boldSystemFont(ofSize: 14)
        btn.layer.cornerRadius = 8
        btn.clipsToBounds = true
        return btn
    }()
    
    let additionalInfoLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.text = "추가 정보 입력"
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    let toggleSwitch: UISwitch = {
        let swc = UISwitch()
        swc.onTintColor = .systemPink
        swc.isEnabled = true
        swc.isOn = true
        return swc
    }()
    
    lazy var components:[UIView] = [titleLabel, idTextField, pwTextField, nickNameTextField, locationTextField, recommandTextField, signInButton, additionalInfoLabel,toggleSwitch]
    
    lazy var inputTargets = [idTextField, pwTextField, nickNameTextField, locationTextField, recommandTextField ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        configure()
        setContstraints()
        setupBindingObject()
    }
    
    private func setupBindingObject() {
        for (idx, obj) in inputTargets.enumerated() {
            let object = viewModel.textFieldObject[idx]
            object.bind { text in
                obj.text = text
            }
        }
        
        viewModel.isValid.bind { bool in
            self.signInButton.isEnabled = bool
            self.signInButton.backgroundColor = bool ? .red : .black
        }
    }
    
    
    private func configure() {
        components.forEach { components in
            view.addSubview(components)
        }
        
        inputTargets.forEach { $0.addTarget(self, action: #selector(eachButtonChanged), for: .editingChanged)
        }
    }
    
    @objc func eachButtonChanged() {
        
        for (idx, _) in inputTargets.enumerated() {
            let object = viewModel.textFieldObject[idx]
            object.value = inputTargets[idx].text ?? ""
            viewModel.checkValidation()
        }
    }
    
    private func setContstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(60)
            make.width.equalTo(view).multipliedBy(0.6)
        }
        
        idTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(80)
            make.height.equalTo(40)
            make.width.equalTo(view).multipliedBy(0.8)
        }
        
        pwTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(idTextField.snp.bottom).offset(15)
            make.height.width.equalTo(idTextField)
        }
        
        nickNameTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(pwTextField.snp.bottom).offset(15)
            make.height.width.equalTo(idTextField)
        }
        
        locationTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nickNameTextField.snp.bottom).offset(15)
            make.height.width.equalTo(idTextField)
        }
        
        recommandTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(locationTextField.snp.bottom).offset(15)
            make.height.width.equalTo(idTextField)
        }
        signInButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(recommandTextField.snp.bottom).offset(15)
            make.height.equalTo(idTextField).multipliedBy(1.1)
            make.width.equalTo(idTextField)
        }
        additionalInfoLabel.snp.makeConstraints { make in
            make.leading.equalTo(idTextField)
            make.top.equalTo(signInButton.snp.bottom).offset(20)
            make.height.equalTo(15)
        }
        toggleSwitch.snp.makeConstraints { make in
            make.trailing.equalTo(idTextField)
            make.centerY.equalTo(additionalInfoLabel)
        }
    }
}

