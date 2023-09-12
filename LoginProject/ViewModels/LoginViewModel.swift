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
    var isValid = Observable(false)
    
    lazy var textFieldObject = [id, pw, nickName, location, recommander]
    
    func checkValidation() {
        isValid.value = id.value.count >= 6 &&
        pw.value.count >= 8 &&
        !nickName.value.isEmpty &&
        !location.value.isEmpty &&
        !recommander.value.isEmpty
    }
    
}

