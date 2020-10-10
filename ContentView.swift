//
//  ContentView.swift
//  Tutorial
//
//  Created by Kristhian De Oliveira on 9/30/20.
//

import SwiftUI

struct ContentView: View {
    @State var rotation:Double
    @State var spins = 0
    var body: some View {
        VStack {
            AngularGradient(gradient: Gradient(colors: [Color.pink, Color.red, Color.orange, Color.yellow, Color.blue, Color.green]), center: .center)
                .mask(
                    Circle()
                )
                .rotationEffect(.degrees(rotation))
                .animation(.spring(), value: true)
                .onChange(of: /*@START_MENU_TOKEN@*/"Value"/*@END_MENU_TOKEN@*/, perform: { value in
                    rotation = rotation + 90
                })
                .onAppear() {
                    repeat {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            if rotation != 360 {
                                rotation = rotation + 5
                            } else {
                                rotation = 0
                            }
                        }
                        spins = spins + 1
                    } while (spins <= 5000)
                }
                .onChange(of: rotation, perform: { value in
                    repeat {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            if rotation != 360 {
                                rotation = rotation + 5
                            } else {
                                rotation = 0
                            }
                        }
                        spins = spins + 1
                    } while (spins <= 5000)
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(rotation: 0.0)
    }
}
