//
//  ContentView.swift
//  chatbot
//
//  Created by Felipe José on 24/01/22.
//

import SwiftUI

struct ContentView: View {
    @State private var messageText = ""
    @State var messages: [String] = ["Welcome to chaty!"]
    
    var body: some View {
        VStack {
            HStack {
                Text("Chaty")
                    .font(.largeTitle)
                    .bold()
                
                Image(systemName: "bubble.left").font(.system(size: 26))
                    .foregroundColor(Color.red)
            }
                ScrollView {
                    ForEach(messages, id: \.self) {
                        message in if message.contains("[USER]") {
                            let newMessage = message.replacingOccurrences(of: "[USER]", with: "")
                            HStack {
                                Spacer()
                                Text(newMessage)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(.red.opacity(0.5))
                                    .cornerRadius(10)
                                    .padding(.horizontal, 16)
                                    .padding(.bottom,10)
                            }
                        } else {
                            HStack {
                            Text(message)
                                .padding()
                                .foregroundColor(.white)
                                .background(.gray.opacity(0.5))
                                .cornerRadius(10)
                                .padding(.horizontal, 16)
                                .padding(.bottom,10)
                            Spacer()
                        }
                        }
                    } .rotationEffect(.degrees(180))
                } .rotationEffect(.degrees(180))
                
                HStack {
                    TextField("Type something", text: $messageText)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .onSubmit {
                            sendMessage(message: messageText)
                        }
                    Button {
                        sendMessage(message: messageText)
                    } label: {
                        Image(systemName: "paperplane.fill")
                            .font(.system(size: 26))
                            .padding(.horizontal, 10)
                        }
                
                }.padding()
        }
    }
    
    func sendMessage(message: String) {
        withAnimation {
            messages.append("[USER]" + message)
            self.messageText = ""
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation {
                messages.append(getBotResponse(message: message))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
