//
//  CodeViewModel.swift
//  codeTest
//
//  Created by marilise morona on 06/11/23.
//

import Combine
import SwiftUI

class CodeViewModel: ObservableObject {
    
    private(set) var state: CodeViewState
    
    var bindings: (ageUser: Binding<String>, message: Binding<String>){
        return(
            ageUser: Binding(get: { self.state.ageUser }, set: { self.state.ageUser = $0 }),
            message: Binding(get: { self.state.message }, set: { self.state.message = $0 })
        )
    }
    
    init(initialState: CodeViewState = .init()) {
        self.state = initialState
    }
    
    func configureWithCurrentState() {
        self.state = CodeViewState(ageUser: self.state.ageUser, message: self.state.message)
    }
    
    var age: String? {
        didSet {
            validAgeUser() == true ? (state.ageUser = age ?? "") : (state.ageUser = "")
        }
    }
    
    func changeStateButton()-> Bool{
        if state.isEmptyAge {
            return false
        } else {
            return validAgeUser()
        }
    }
    
    func validAgeUser() -> Bool {
        if state.presentSpecialCharacters || state.presentLetters || state.containsWhitespace {
            updateState(ageUser: "", message: "")
            return false
        } else {
            return isValidValueAge()
        }
    }
    
    func isValidValueAge() -> Bool {
        if state.isValidAge {
            updateState(ageUser: state.ageUser, message: "is valid age")
            return true
        } else {
            updateState(ageUser: "", message: "is not valid age")
            return false
        }
    }
    
    func updateState(ageUser: String, message: String) {
        state = CodeViewState(ageUser: ageUser, message: message)
    }
}
