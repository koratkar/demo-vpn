//
//  ContentView.swift
//  VPN-demo
//
//  Created by Ishaan Koratkar on 8/9/21.
//

import SwiftUI

let locations: Array = ["India", "United States", "Canada", "Brazil", "Australia", "United Kingdom", "Japan"]

struct ContentView: View {
    @State private var connected: Bool = false
    @State private var buttonText: String = "Connect"
    @State private var location: String = "None"
    @State private var connectionMessage: String = "You are not connected"
    @State private var buttonColor: Color = Color.green
    var body: some View {
        ZStack {
            Color(.systemBlue)
                .ignoresSafeArea()
            VStack(spacing: 20) {
                Text("VPN Demo")
                    .font(Font.custom("Ubuntu-Regular", size: 40))
                    .foregroundColor(.white)
                    .padding()
                Text(connectionMessage)
                    .font(Font.custom("Ubuntu-Regular", size: 20))
                    .foregroundColor(.white)
                Spacer()
                List {
                    Text("Select a Location")
                        .bold()
                    ForEach(locations, id:\.self) { loc in
                        if location == loc {
                            Text("★ " + loc)
                        } else {
                            Text(loc)
                                .onTapGesture {
                                    self.location = loc
                                    if connected {
                                        self.connectionMessage = "You are connected to \(self.location)"
                                    }
                                }
                        }
                    }
                }
                Button(action: {
                    if connected {
                        // Actions for disconnecting
                        self.connected = false
                        self.buttonText = "Connect"
                        self.location = "None"
                        self.connectionMessage = "You are not connected"
                        self.buttonColor = Color.green
                    } else {
                        // Actions for connecting
                        self.connected = true
                        self.buttonText = "Disconnect"
                        self.connectionMessage = "You are connected to \(self.location)"
                        self.buttonColor = Color.red
                    }
                }) {
                    //button looks here
                    Text(buttonText)
                        .padding()
                        .font(Font.custom("Ubuntu-Regular", size: 20))
                        .foregroundColor(.black)
                        .background(buttonColor)
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
