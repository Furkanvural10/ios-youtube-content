
import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Rectangle, Rounded Rec. Capsule, Elipse, Circle")
        // MARK: - Rectangle
        //        Rectangle()
        //            .fill(.red)
        //            .frame(width: 200, height: 200)
        //            .clipShape(RoundedRectangle(cornerRadius: 20))
        
        // MARK: - Rounded Rectangle
        //                VStack(spacing: 50) {
        //                    RoundedRectangle(cornerRadius: 20, style: .circular)
        //                        .fill(.blue)
        //                        .frame(width: 300, height: 70)
        //
        //                    RoundedRectangle(cornerRadius: 20, style: .continuous)
        //                        .fill(.orange)
        //                        .frame(width: 300, height: 70)
        //                }
        
        // MARK: - Capsule
        //        Capsule()
        //            .fill(.pink)
        //            .frame(width: 300, height: 50)
        
        // MARK: - Elipse
        //        Ellipse()
        //            .fill(.blue)
        //            .frame(width: 200, height: 100)
        
        // MARK: - Circle
        //        Circle()
        //            .fill(.cyan)
        //            .frame(height: 200)  
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
