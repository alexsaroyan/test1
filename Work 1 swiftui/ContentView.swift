import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // Header
            HStack {
                Text("svibti iuai eksersaisi")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                Spacer()
            }
            
            // Top Cards
            HStack(spacing: 13) {
                // Left Card
                VStack(alignment: .leading, spacing: 0) {
                    Image("guitar_image") // Replace with your actual image name
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 165, height: 232)
                        .padding(.trailing, -9)
                    
                    Text("We love property wrappers and closures")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                }
                .background(Color.yellow)
                .cornerRadius(18, corners: [.topLeft])
                .frame(width: 165, height: 232)
                
                // Right Cards
                VStack(spacing: 13) {
                    VStack(alignment: .leading, spacing: 0) {
                        Image("chat_image") // Replace with your actual image name
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 165, height: 110)
                            .padding(.trailing, -23)
                        
                        Text("ჩატები")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                    }
                    .background(Color.orange)
                    .cornerRadius(18, corners: [.topLeft])
                    .frame(width: 165, height: 110)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Image("megaphone_image") // Replace with your actual image name
                            .resizable()
                            .frame(width: 165, height: 110)
                            .padding(.trailing, -23)
                        
                        Text("განცხადება")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                    }
                    .background(Color.purple)
                    .cornerRadius(18, corners: [.topLeft])
                    .frame(width: 165, height: 110)
                }
            }
            .padding(.horizontal)
            
            // List Items
            List {
                ForEach(0..<6) { item in
                    HStack {
                        Image(systemName: "doc.text")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .padding(.trailing, 8)
                        VStack(alignment: .leading) {
                            Text("List Item Title")
                                .font(.headline)
                            Text("List item subtitle goes here")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
        }
        .background(Color(.systemBackground).edgesIgnoringSafeArea(.all))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
