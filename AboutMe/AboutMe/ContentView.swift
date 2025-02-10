import SwiftUI

struct ContentView: View {
    @State private var isExpanded = false
    @State private var isExpanded2 = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Hello!👋")
                    .font(.title)
                    .bold()
                
                VStack {
                    Image("Anara")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(15)
                    Text("(Hair AI generated)").font(.caption2)
                }
                .padding()

                Text("General Info📜")
                    .font(.title)
                    .bold()
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("🪪 Name:")
                            .padding(.bottom, -3.0)
                        Text("Anuar Adilbek")
                            .padding(.all, 5.0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 10.0)
                                .fill(Color.gray.opacity(0.2)))
                        
                        Text("🧑‍🦱 Age:")
                            .padding(.bottom, -3.0)
                        Text("20 Years Old")
                            .padding(.all, 5.0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 10.0)
                                .fill(Color.gray.opacity(0.2)))
                        
                        Text("📍Location:")
                            .padding(.bottom, -3.0)
                        Text("Almaty, Kazakhstan")
                            .padding(.all, 5.0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 10.0)
                                .fill(Color.gray.opacity(0.2)))
                        Text("Short bio:")
                            .padding(.bottom, -3.0)
                        Text("Backend developer, basketball player, interested in IOS development")
                            .padding(.all, 5.0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 10.0)
                                .fill(Color.gray.opacity(0.2)))
                    }
                    
                    
                    Spacer()
                }

                NavigationLink(destination: HobbiesUIView()) {
                    Text("Go to Hobbies")
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.top, 10)
                
                Spacer()
            }
            .padding()
        }
    }
}


#Preview {
    ContentView()
}
