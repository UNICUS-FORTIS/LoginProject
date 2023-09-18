//
//  ViewModel.swift
//  CustomViewPractice
//
//  Created by LOUIE MAC on 2023/09/13.
//

import Foundation

class LoginViewModel {
    
    var id = Observable("")
    var pw = Observable("")
    var nickName = Observable("")
    var location = Observable("")
    var recommander = Observable("")
    var isAllValid = Observable(false)
    
    var emailIsValid = Observable(false)
    var pwIsValid = Observable(false)
    var nicknameIsValid = Observable(false)
    var locationIsValid = Observable(false)
    var recommandIsValid = Observable(false)
    
    lazy var textFieldObject = [id, pw, nickName, location, recommander]
    
    func checkValidation() {
        print(#function)
        isAllValid.value = id.value.contains("@") &&
        id.value.contains(".") &&
        pw.value.count >= 8 &&
        !nickName.value.isEmpty &&
        !location.value.isEmpty &&
        !recommander.value.isEmpty
    }
    
    func checkEmailValidation() {
        print(#function)
        emailIsValid.value = id.value.count >= 6 && id.value.contains("@") && id.value.contains(".")
    }
    
    func checkPwValidation() {
        print(#function)
        pwIsValid.value = pw.value.count >= 8
    }
    
    func checkNicknameValidation() {
        print(#function)
        nicknameIsValid.value = !nickName.value.isEmpty
    }
    
    func checkLocationValidation() {
        print(#function)
        locationIsValid.value = !location.value.isEmpty
    }
    
    func checkRecommandValidation() {
        print(#function)
        recommandIsValid.value = !recommander.value.isEmpty
    }
}



