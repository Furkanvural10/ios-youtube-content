
import SwiftUI

struct ContentView: View {
    var body: some View {
        
        // MARK: - Rectangle
//        Rectangle()
//            .fill(.red)
//            .frame(width: 200, height: 200)
//            .clipShape(RoundedRectangle(cornerRadius: 20))
        
                VStack(spacing: 50) {
                    RoundedRectangle(cornerRadius: 20, style: .circular)
                        .fill(.blue)
                        .frame(width: 300, height: 70)
        
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(.orange)
                        .frame(width: 300, height: 70)
                }

        

        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
