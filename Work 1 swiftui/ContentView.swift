import SwiftUI

struct ContentView: View {
    @State private var isRefreshed: Bool = false
    @State private var leftCardText: String = "We love property wrappers and closures"
    @State private var rightCardColor: Color = .orange
    
    var body: some View {
        VStack(spacing: 23) {
            
            HStack {
                Text("Super App")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                Spacer()
            }
            .padding(.top, 40)
            
            
            HStack(spacing: 13) {
                
                ZStack(alignment: .bottomLeading) {
                    Image("guitar")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 165, height: 232)
                    
                    VStack(alignment: .leading) {
                        Text(leftCardText)
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.bottom, 30)
                        
                        Button(action: {
                            leftCardText = "We love Xcode"
                        }) {
                            Image("iconmic")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .padding()
                        }
                    }
                }
                .background(Color.yellow)
                .cornerRadius(18, corners: [.topLeft])
                .frame(width: 165, height: 232)
                
                
                VStack(spacing: 13) {
                    ZStack(alignment: .bottomLeading) {
                        Image("ccc")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 165, height: 110)
                        
                        VStack(alignment: .leading) {
                            Text("ჩატები")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.bottom, 10)
                            
                            Button(action: {
                                rightCardColor = rightCardColor == .orange ? .green : .orange
                            }) {
                                Image("iconchat")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .padding()
                            }
                        }
                    }
                    .background(rightCardColor)
                    .cornerRadius(18, corners: [.topLeft])
                    .frame(width: 165, height: 110)
                    
                    ZStack(alignment: .bottomLeading) {
                        Image("mmm")
                            .resizable()
                            .frame(width: 165, height: 110)
                        
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
            .padding(.bottom, 16)
            
            
            List {
                ForEach(listItems.indices, id: \.self) { index in
                    HStack {
                        Image("sms")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .padding(.trailing, 8)
                        VStack(alignment: .leading) {
                            Text(listItems[index].title)
                                .font(.headline)
                                .foregroundColor(.white)
                            Text(listItems[index].subtitle)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.vertical, 8)
                    .listRowBackground(Color.clear)
                }
            }
            .scrollContentBackground(.hidden)
            .background(Color(hex: "#19252B"))
            
            
            HStack {
                Spacer()
                Button(action: {
                    isRefreshed.toggle()
                }) {
                    Image("refresh")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(isRefreshed ? .green : .blue)
                }
                .padding()
            }
            .padding(.bottom, 16)
        }
        .background(Color(hex: "#19252B").edgesIgnoringSafeArea(.all))
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

struct ListItem {
    let title: String
    let subtitle: String
}

let listItems: [ListItem] = [
    ListItem(title: "რა დაუწუნა ბარბარემ ნიკის?", subtitle: "ნიკის ამაზე ჯერ განცხადება არ გაუკეთებია, ფანები ელოდებიან რომ რომელიმე მალე სიჩუმეს გაფანტავს"),
    ListItem(title: "რა ზომის ფეხი აქვს ვასოს?", subtitle: "დეველოპერებმა განაცხადეს რომ თუ მას 42 და მეტი ზომა ფეხი აქვს მის მოსმენას აზრი არ აქვს და კომენტარის გარეშე დატოვებენ ლექციას"),
    ListItem(title: "რა სიმაღლისაა ანჟელა ew?", subtitle: "ანჟელა ew არის მეტრაოთხმოცი, რაც ნიშნავს რომ ის დაახლოებით ტეილორ Swift-ის სიმაღლისაა და დიდი ფეხი აქვს"),
    ListItem(title: "რატომ გაებუტა ბარბარეს ჭეპეტე?", subtitle: "ამჟამინდელი მონაცემებით ისინი 2 დღე არ ესაუბრებოდნენ ერთმანეთს და როგორც გაირკვა ანიგნორებს აიგნორებდნენ რაღაც იგნორში."),
    ListItem(title: "MVC vs MVVM", subtitle: "აი ეს MVC გასაგებია, მაგრამ MVVM ჩემამდე არ დადის რა, ამ სვიბთ იუაიში სად ვიყენებთ მაგას?"),
    ListItem(title: "ნეტავ რამდენი ხანი გაგრძელდება ეს?", subtitle: "აღმოჩნდა რომ დეველოპერები ძალიან გახარებულები არიან SwiftUI-ით. ნეტავ რამდენი ხანი გაგრძელდება Honeymoon phase?")
]

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

