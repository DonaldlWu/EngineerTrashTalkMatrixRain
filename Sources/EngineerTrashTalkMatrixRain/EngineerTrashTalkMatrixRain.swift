import SwiftUI

@available(iOS 14, macOS 12.0, *)
public struct MatrixRainView: View {
    
    public var body: some View {
        ZStack {
            Color.black
            
            GeometryReader { proxy in
                let size = proxy.size
                
                HStack(spacing: 28) {
                    ForEach(1...Int(size.width / 50), id: \.self) {_ in
                        MatrixRainCharacters(size: size)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

@available(iOS 14, macOS 12.0, *)
struct MatrixRainView_Previews: PreviewProvider {
    static var previews: some View {
        MatrixRainView()
    }
}
