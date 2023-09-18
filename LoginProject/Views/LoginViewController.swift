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
    
    let statusLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .lightGray
        label.textColor = .black
        label.font = .systemFont(ofSize: 13)
        label.textAlignment = .center
        label.layer.cornerRadius = 8
        label.clipsToBounds = true
        return label
    }()
    
    lazy var components:[UIView] = [titleLabel, idTextField, pwTextField, nickNameTextField, locationTextField, recommandTextField, signInButton, additionalInfoLabel, toggleSwitch, statusLabel]
    
    lazy var inputTargets = [idTextField, pwTextField, nickNameTextField, locationTextField, recommandTextField ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        configure()
        setContstraints()
        setupBindingObject()
        statusLabel.text = ""
    }
    
    private func setupBindingObject() {
        for (idx, obj) in inputTargets.enumerated() {
            let object = viewModel.textFieldObject[idx]
            object.bind { text in
                obj.text = text
            }
        }
        
        viewModel.isAllValid.bind { bool in
            self.signInButton.isEnabled = bool
            self.signInButton.backgroundColor = bool ? .red : .black
        }
        
        viewModel.emailIsValid.bind { bool in
            self.statusLabel.text = bool ? "올바른 이메일 주소 입니다." : "올바른 이메일 주소를 입력해주세요."
            self.idTextField.backgroundColor = bool ? .systemGreen : .gray
        }
        
        viewModel.pwIsValid.bind { bool in
            self.statusLabel.text = bool ? "올바른 패스워드 입니다." : "패스워드는 8자 이상입니다."
            self.pwTextField.backgroundColor = bool ? .systemGreen : .gray
        }
        
        viewModel.nicknameIsValid.bind { bool in
            self.statusLabel.text = bool ? "닉네임이 입력되었습니다." : "닉네임을 입력해 주세요."
            self.nickNameTextField.backgroundColor = bool ? .systemGreen : .gray
        }
        
        viewModel.locationIsValid.bind { bool in
            self.statusLabel.text = bool ? "지역정보가 입력되었습니다." : "지역정보를 입력해 주세요."
            self.locationTextField.backgroundColor = bool ? .systemGreen : .gray
        }
        
        viewModel.recommandIsValid.bind { bool in
            self.statusLabel.text = bool ? "추천인이 입력되었습니다." : "추천인을 입력해 주세요."
            self.recommandTextField.backgroundColor = bool ? .systemGreen : .gray
        }
    }
    
    
    private func configure() {
        components.forEach { components in
            view.addSubview(components)
        }
        
        inputTargets.forEach { $0.addTarget(self, action: #selector(eachButtonChanged), for: .editingChanged) }
        
    }
    
    @objc func eachButtonChanged(_ textField: SignInfoTextField) {
        guard let idx = inputTargets.firstIndex(of: textField) else { return }
        let object = viewModel.textFieldObject[idx]
        object.value = textField.text ?? ""
        viewModel.checkValidation()
        
        switch idx {
        case 0: viewModel.checkEmailValidation()
        case 1: viewModel.checkPwValidation()
        case 2: viewModel.checkNicknameValidation()
        case 3: viewModel.checkLocationValidation()
        case 4: viewModel.checkRecommandValidation()
        default: break
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
        
        statusLabel.snp.makeConstraints { make in
            make.width.equalTo(idTextField)
            make.height.equalTo(idTextField)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-40)
            make.centerX.equalTo(view)
        }
    }
}

