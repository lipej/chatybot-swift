//
//  BotResponse.swift
//  chatbot
//
//  Created by Felipe José on 24/01/22.
//

import Foundation

func getBotResponse(message: String) -> String {
    let tempMessage = message.lowercased()
    
    if tempMessage.contains("hello") {
        return "Hey! How are U? :D"
    } else if tempMessage.contains("bye") {
        return "Ok, See ya!"
    }
    
    return "Ops, don't understand u... :/"
}
