//
//  ContentView.swift
//  ImageScrollView
//
//  Created by Brian Floersch on 7/2/23.
//

import SwiftUI
import LazyPager

struct ContentView: View {
    
    @State var data = [
        "nora1",
        "nora2",
        "nora3",
        "nora4",
        "nora5",
        "nora6",
    ]
    
    @State var show = true
    @State var opacity: CGFloat = 1
    @State var index = 0
    var body: some View {
        
        VStack {
            VStack {
                Button("Open") {
                    show.toggle()
                }
            }
        }
        .fullScreenCover(isPresented: $show) {
            ZStack {
                LazyPager(data: data, page: $index) { data in
                    Image(data)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .zoomable(min: 1, max: 5)
                .onDismiss(backgroundOpacity: $opacity) {
                    show = false
                }
                .onTap {
                    print("tap")
                }
            }
            .background(ClearFullScreenBackground())
            .ignoresSafeArea()
            .background(.black.opacity(opacity))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
