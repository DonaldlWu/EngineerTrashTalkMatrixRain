//
//  File.swift
//  
//
//  Created by 吳得人 on 2022/2/9.
//

import SwiftUI

struct MatrixRainCharacters: View {
    var size: CGSize
    @State var startAnimation: Bool = false
    @State var random: Int = 0
    
    var body: some View {
        let randomHeight: CGFloat = .random(in: (size.height / 2)...size.height)
        VStack {
            
            ForEach(0..<constant.count, id: \.self) { index in
                let character = Array(constant)[getRandomIndex(index: index)]
                
                Text(String(character))
                    .font(.system(size: 25, weight: .light, design: .default))
                    .foregroundColor(Color.green)
            }
        }
        .mask(alignment: .top) {
            Rectangle()
                .fill(
                    LinearGradient(colors: [
                        .clear,
                        .black.opacity(0.1),
                        .black.opacity(0.2),
                        .black.opacity(0.3),
                        .black.opacity(0.5),
                        .black.opacity(0.7),
                        .black
                    ], startPoint: .top, endPoint: .bottom)
                )
                .frame(height: size.height / 2)
                .offset(y: startAnimation ? size.height : -randomHeight)
        }
        .onAppear {
            withAnimation(.linear(duration: 3).delay(.random(in:0...2)).repeatForever(autoreverses: false)) {
                startAnimation.toggle()
            }
        }
        .onReceive(Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()) { _ in
            random = Int.random(in: 0..<constant.count)
            
        }
    }
    
    func getRandomIndex(index: Int) -> Int {
        let max = constant.count - 1
        if (index + random) > max {
            if (index - random) < 0 {
                return index
            }
            return (index - random)
        } else {
            return (index + random)
        }
    }
}

// MARK: - Random Characters
let constant = "工程師幹話，工程師應該要放心大膽的不寫文件，開始寫程式之後，你有什麼感覺呢？看到好的程式碼，會讓我很舒服。如果一個 Adapter 不夠，你可以用兩個。唔…要在…要在白板上直接來嗎？好害羞喔！「太太，我喜歡妳啊！」。老闆有交代：你要寫這種東西，好歹用個匿名帳號!幹話不只是一種狀態，更是一種心態。不但不解決問題，還要解決提出問題的人，才是真正意義上的幹話。當你隨時覺得自己高人一等，俯視天下，鄙夷眾生，你才能講得出幹話。你沒說要解決問題，也沒有說不要，沒有結論。身為 PM，你應該要導入 Scrum。才這麼一點會議就拒絕配合，這樣團隊要怎麼充分討論，凝聚共識？身為軟體工程師，你應該要盡量寫出無法維護的程式碼，而且絕對不寫測試。"
