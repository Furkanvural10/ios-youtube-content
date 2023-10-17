
import SwiftUI

struct ContentView: View {
    var body: some View {
        
//        MARK: - VStack Example
        VStack {
            
            Image(systemName: "car")
                .font(.system(size: 80))
            Spacer()
            Image(systemName: "car.fill")
                .font(.system(size: 80))
         
        }
        
//        MARK: - Spacer with different position (VStack)
//        VStack {
//            Spacer()
//            Image(systemName: "car")
//                .font(.system(size: 80))
//
//            Image(systemName: "car.fill")
//                .font(.system(size: 80))
//
//        }
        
//        VStack {
//            Image(systemName: "car")
//                .font(.system(size: 80))
//            Image(systemName: "car.fill")
//                .font(.system(size: 80))
//            Spacer()
//        }
        
        
        
        
        
        
//        MARK: - HStack Example
//        HStack {
//            Image(systemName: "car")
//                .font(.system(size: 80))
//            Spacer()
//            Image(systemName: "car.fill")
//                .font(.system(size: 80))
//        }
        
        
//        MARK: - Spacer with different position (HStack)
//        HStack {
//            Spacer()
//            Image(systemName: "car")
//                .font(.system(size: 80))
//
//            Image(systemName: "car.fill")
//                .font(.system(size: 80))
//        }
        
//        HStack {
//            Image(systemName: "car")
//                .font(.system(size: 80))
//            Image(systemName: "car.fill")
//                .font(.system(size: 80))
//            Spacer()
//        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
