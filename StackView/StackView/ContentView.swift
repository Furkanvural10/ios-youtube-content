import SwiftUI

struct ContentView: View {
    var body: some View {
        
        // StackView -> VStack, HStack, ZStack
        VStack {
            
        
        VStack(alignment: .center, spacing: 10) {
            Rectangle()
                .frame(width: 50, height: 60)
            Text("T1")
            Text("T2")
            Text("T3")
            Button("B1") {
                print("Clicked")
            }
        }
        .padding(20)
        .background(.red)
            
        
            
        
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
