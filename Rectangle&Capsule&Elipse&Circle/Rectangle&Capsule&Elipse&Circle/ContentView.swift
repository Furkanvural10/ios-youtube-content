
import SwiftUI

struct ContentView: View {
    var body: some View {
        
        // MARK: - Rectangle
        Rectangle()
            .fill(.red)
            .frame(width: 200, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        

        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
