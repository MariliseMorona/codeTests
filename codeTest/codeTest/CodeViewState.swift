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
    var maxValue: Int = 10
    var minValue: Int = 0
    
    var isEmptyAge: Bool {
        ageUser.isEmpty == true ? true : false
    }
    
    var isValidAge: Bool {
        if let age = Int(ageUser), age >= minValue, age <= maxValue {
            return true
        }
        return false
    }
    
    var presentSpecialCharacters: Bool {
        var charSet = CharacterSet.init(charactersIn: "@#%+_)(!,;:'˜!ˆ&=-}{][/")
        return ageUser.rangeOfCharacter(from: charSet) != nil
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
