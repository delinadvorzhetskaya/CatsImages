//
//  ContentView.swift
//  CatsImages
//
//  Created by Дэлина Дворжецкая on 18.11.2021.
//

import SwiftUI

struct ContentView: View {
    @State var buttonIsHidden = true
    @State var resizing = true

    
    var body: some View {
        
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 30) {
                    ForEach(0...CatsViewModel.allImages.count - 1, id: \.self) {image in
                        Image(CatsViewModel.allImages[image])
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: self.resizing ? 150 : 280, height: self.resizing ? 150 : 280)
                            .gesture(
                                TapGesture()
                                    .onEnded({ _ in
                                        withAnimation {
                                            self.resizing.toggle()
                                        }
                                self.buttonIsHidden.toggle()
                                    })
                            )

                        Button("Zoom") { }
                            .hiddenConditionally(isHidden: buttonIsHidden)
                        }
                }
            }
            
            .navigationBarTitle("Cats", displayMode: .large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func hiddenConditionally(isHidden: Bool) -> some View {
        isHidden ? AnyView(self.hidden()) : AnyView(self)
    }
}
