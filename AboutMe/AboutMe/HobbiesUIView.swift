import SwiftUI

struct HobbiesUIView: View {
    @State private var isExpandedBasketball = false
    @State private var isExpandedHiking = false
    var body: some View {
        NavigationStack {
            ScrollView{
                
                
                VStack{
                    Text("My Hobbies🏞️")
                        .font(.title)
                        .bold(true)
                    HStack {
                        VStack(alignment: .leading) {
                            Button(action: {
                                withAnimation {
                                    isExpandedBasketball.toggle()
                                }
                            }) {
                                HStack {
                                    Text("🏀 Basketball")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .foregroundColor(.black)
                                    Spacer()
                                    Image(systemName: isExpandedBasketball ? "chevron.up" : "chevron.down")
                                        .foregroundColor(.black)
                                }
                            }
                            .contentShape(Rectangle())
                            .padding()
                            
                            if isExpandedBasketball {
                                VStack(alignment: .leading, spacing: 5) {
                                    Image("Бацкетбол")
                                        .resizable()
                                        .frame(width: 250, height: 250)
                                        .aspectRatio(contentMode: .fit)
                                        .cornerRadius(15)
                                    Text("I play basketball since 2018, participated in Almaty championships, 3x3 tournaments, 2 times KBTU Cup winner 🏆")
                                }
                                .padding()
                                .transition(.opacity.combined(with: .move(edge: .top)))
                            }
                            
                        }
                        
                        
                        Spacer()
                    }
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Button(action: {
                                withAnimation {
                                    isExpandedHiking.toggle()
                                }
                            }) {
                                HStack {
                                    Text("🏔️ Hiking")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .foregroundColor(.black)
                                    Spacer()
                                    Image(systemName: isExpandedHiking ? "chevron.up" : "chevron.down")
                                        .foregroundColor(.black)
                                }
                            }
                            .contentShape(Rectangle())
                            .padding()
                            
                            if isExpandedHiking {
                                VStack(alignment: .leading, spacing: 5) {
                                    Image("Mountains")
                                        .resizable()
                                        .frame(width: 200, height: 200)
                                        .aspectRatio(contentMode: .fit)
                                        .cornerRadius(15)
                                    Text("I love to hike especially with great amout of places to explore in Almaty. I have been to Big Almaty Lake, Kok Zhailay, Medeu, Shymbulaq, and I wish to climb up the Furmanov Peak")
                                }
                                .padding()
                                .transition(.opacity.combined(with: .move(edge: .top)))
                            }
                            
                        }
                        
                        
                        Spacer()
                    }
                    .padding(.top, -10)
                    
                    NavigationLink(destination: GoalsView()) {
                        Text("Go to Goals")
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding([.top, .leading, .trailing], 10)
                    
                    Spacer()
                    
                }
                
            }   
            
        }
    }
}

#Preview {
    HobbiesUIView()
}
