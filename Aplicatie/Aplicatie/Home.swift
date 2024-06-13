import SwiftUI
import Foundation

struct Animal: Codable {
    let type: String
    let image: String
}

struct Home: View {
    @State private var animals: [Animal] = []
    @State private var isLoading = true // Added state for loading indicator
    @State private var isBreathing = true // Added state for loading indicator

    var body: some View {
        ZStack {
            Color.fadedPink // Set background color
            if isLoading {
                VStack {
                    Image("LogoTransparent") // Custom loading indicator
                        .frame(width: 50, height: 50)
                        .foregroundColor(.white)
                        .overlay(
                            Circle()
                                .stroke(Color.fadedPink, lineWidth: 400)
                                .frame(width: 500, height: 500)
                                .offset(y: 30)
                        )
                        .offset(y: -50)
                        .opacity(isBreathing ? 1 : 0.5) // Apply opacity based on isLo
                    
                        .onAppear {
                            Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
                                withAnimation {
                                    self.isBreathing.toggle()
                                }
                            }
                        }
                }
            } else {
                ScrollView() {
                    VStack {
                        ForEach(animals, id: \.type) { animal in
                            RoundedRectangle(cornerRadius: 25)
                                .fill(Color.white)
                                .frame(width: 350, height: 330)
                                .overlay(
                                    VStack {
                                        if let url = URL(string: animal.image),
                                           let imageData = try? Data(contentsOf: url),
                                           let uiImage = UIImage(data: imageData) {
                                            Image(uiImage: uiImage)
                                                .resizable()
                                                .cornerRadius(20)
                                                .frame(width:350)
                                        } else {
                                            Text("Failed to load image")
                                                .foregroundColor(.red)
                                        }
                                        
                                        HStack(){
                                            Text(animal.type)
                                                .font(.title)
                                                .fontWeight(.bold)
                                                .foregroundColor(.black)
                                            Spacer()
                                            Image(systemName: "mappin.and.ellipse")
                                            Text("Timisoara")
                                        }
                                        .padding(.horizontal)
                                        
                                        HStack(){
                                            Text("Caca")
                                            Spacer()
                                        }
                                        .padding()
                                    }
                                )
                                .padding(.horizontal)
                                .padding(.bottom, 3)
                        }
                    }
                }
                .padding()
                .background(.fadedPink)
                .onAppear {
                    loadData()
                }
                
            }
        }
        .onAppear {
            loadData()
        }
    }

    func loadData() {
        guard let url = URL(string: "https://raw.githubusercontent.com/PurzaVlad/API/main/animale.json") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode([String: [Animal]].self, from: data)
                if let animalData = decodedData["animale"] {
                    DispatchQueue.main.async {
                        self.animals = animalData
                        self.isLoading = false // Set isLoading to false when data is loaded

                    }
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
}

#Preview {
    Home()
}

