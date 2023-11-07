//
//  CodeViewState.swift
//  codeTest
//
//  Created by marilise morona on 06/11/23.
//

import Foundation

struct CodeViewState: Equatable {
    var ageUser: String = ""
    var message: String = ""
    
    var isEmptyAge: Bool {
        ageUser.isEmpty == true
    }
    
    var isValidAge: Bool {
        if let age = Int(ageUser), age >= 0, age <= 10 {
            return true
        }
        return false
    }
    
    var presentSpecialCharacters: Bool {
        var charSet = CharacterSet.init(charactersIn: "@#$%+_)(")
        if let strvalue = ageUser.rangeOfCharacter(from: charSet) {
            return true
        } else {
            return false
        }
    }
    
    var presentLetters: Bool {
        let charSet = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
        if let _ = ageUser.rangeOfCharacter(from: charSet) {
            return true
        } else {
            return false
        }
    }
    
    var containsWhitespace: Bool {
        let whitespaceSet = CharacterSet.whitespaces
        return ageUser.rangeOfCharacter(from: whitespaceSet) != nil
    }
    
    var messageSuccess: String {
        return "número dentro do intervalo"
    }
    
    var messageFailure: String {
        return "número fora do intervalo"
    }
    
    var testError: String {
        return "entrada inválida"
    }
    
}
