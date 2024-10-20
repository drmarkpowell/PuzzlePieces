//
//  ContentView.swift
//  PuzzlePieces
//
//  Created by Mark Powell on 9/29/24.
//

import SwiftUI


struct ContentView: View {
    @State private var endAmount: CGFloat = 0

    var body: some View {
        VStack {
//            Image(systemName: "globe")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 200, height: 200)
//                .padding()
//                .background(.yellow)
//                .foregroundStyle(.tint)
//                .clipShape(Jigsaw())
//            Jigsaw(width: 370, height: 370)

            PuzzlePiece()
                .trim(from: 0, to: endAmount)
                .stroke(Color.blue, lineWidth: 4)
                .frame(width: 300, height: 300)
                .onAppear {
                    withAnimation(Animation.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                        self.endAmount = 1
                    }
                }


            Text("Hello, world!")

            Image(systemName: "globe")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .padding()
                .background(.green)
                .clipShape(PuzzlePiece())
        }
        .padding()
    }
}



#Preview {
    ContentView()
}
