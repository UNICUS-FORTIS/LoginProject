//
//  ViewController.swift
//  CustomViewPractice
//
//  Created by LOUIE MAC on 2023/08/24.
//

import UIKit
import SnapKit

final class FollowUpViewController: UIViewController {

    lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.text = "JJAPFLIX"
        label.textColor = .red
        label.font = .boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        return label
    }()
    
    lazy var idTextField = SignInfoTextField(placeHolder: SignInCategory.idTextField)
    lazy var pwTextField = SignInfoTextField(placeHolder: SignInCategory.pwTextField)
    lazy var nickNameTextField = SignInfoTextField(placeHolder: SignInCategory.nickName)
    lazy var locationTextField = SignInfoTextField(placeHolder: SignInCategory.location)
    lazy var recommandTextField = SignInfoTextField(placeHolder: SignInCategory.recommanded)
    
    lazy var signInButton:UIButton = {
        let btn = UIButton()
        btn.setTitle("회원가입", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .black
        btn.titleLabel?.font = .boldSystemFont(ofSize: 14)
        btn.layer.cornerRadius = 8
        btn.clipsToBounds = true
        return btn
    }()
    
    lazy var additionalInfoLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.text = "추가 정보 입력"
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    lazy var toggleSwitch: UISwitch = {
        let swc = UISwitch()
        swc.onTintColor = .systemPink
        swc.isEnabled = true
        swc.isOn = true
        return swc
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        var components:[Any] = [titleLabel, idTextField, pwTextField, nickNameTextField, locationTextField, recommandTextField, signInButton, additionalInfoLabel,toggleSwitch]
        components.forEach { components in
            view.addSubview(components as! UIView)
        }

        setContstraints()
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

