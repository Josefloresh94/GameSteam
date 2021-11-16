//
//  Home.swift
//  GameSteam
//
//  Created by José Flores on 15/10/21.
//

import SwiftUI
import AVKit

struct Home: View {
    
    @State var tabSeleccionado: Int = 2
    
    var body: some View {
        
        TabView (selection: $tabSeleccionado) {
            ProfileView()
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "person")
                    Text("Perfil")
                }.tag(0)
            GamesView()
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Juegos")
                }.tag(1)
            PantallaHome()
                .tabItem {
                    Image(systemName: "house")
                    Text("Inicio")
                }.tag(2)
            FavoritesView()
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favoritos")
                }.tag(3)
        }
        .accentColor(.white)
        
    }
    
    init() {
        UITabBar.appearance().barTintColor = UIColor(Color("TabBar"))
        UITabBar.appearance().isTranslucent = true
        print("Iniciando las vistas de Home")
    }
}

struct PantallaHome: View {
   
    var body: some View {
        ZStack {
            Color("Marine").ignoresSafeArea()
            VStack {
                Image("appLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .padding(.horizontal, 11.0)
                
                ScrollView(showsIndicators: false){
                    SubModuloHome()
                }
            }.padding(.horizontal, 18)
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
    }
}

struct SubModuloHome: View {
    
    @State var textoBusqueda:String = ""
    
    @ObservedObject var juegoEncontrado = SearchGame()
    @State var isGameViewActive = false
    @State var isGameInfoEmpty = false
    
    @State var url:String = ""
    @State var titulo:String = ""
    @State var studio:String = ""
    @State var calificacion:String = ""
    @State var añoPublicacion:String = ""
    @State var descripcion:String = ""
    @State var tags:[String] = [""]
    @State var imgsUrl:[String] = [""]
    
    var dispositivo = UIDevice.current.model
    
    var body: some View {
        VStack {
            
            HStack{
                Button(
                    action: {
                        watchGame(name:textoBusqueda)
                    },
                    label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(textoBusqueda.isEmpty ? Color(.yellow) : Color("Dark-Cian"))
                    }).alert(isPresented: $isGameInfoEmpty){
                        Alert(title: Text("Error"), message: Text("No se encontró el juego"), dismissButton: .default(Text("Entendido")))
                    }
                
                ZStack(alignment: .leading) {
                    if textoBusqueda.isEmpty {
                        Text(dispositivo)
                            .foregroundColor(Color(red:174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                    }
                    TextField("", text: $textoBusqueda)
                        .foregroundColor(.white)
                }
            }
            .padding([.top,.leading,.bottom], 11.0)
            .background(Color("Blue-Gray"))
            .clipShape(Capsule())
            
            Text("LOS MÁS POPULARES")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            
            ZStack {
                Button(
                    action: {
                        watchGame(name: "The Witcher 3")
                    },
                    label: {
                        VStack(spacing: 0){
                            Image("theWitcher")
                                .resizable()
                                .scaledToFill()
                            Text("The Witcher 3: Wild Hunt")
                                .font(.title3)
                                .bold()
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .background(Color("Blue-Gray"))
                        }
                    })
                
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 42, height: 42)
            }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                .padding(.vertical)
            
            Text("CATEGORÍAS SUGERIDAS PARA TI")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top, 25)
                .padding(.bottom, 10)
            
            ScrollView(.horizontal, showsIndicators: false) {
                if(dispositivo == "iPad"){
                    HStack{
                        Button(action: {}, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color("Blue-Gray"))
                                    .frame(width: 320, height: 180)
                                Image("fps")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 84, height: 84)
                            }
                        })
                        Button(action: {}, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color("Blue-Gray"))
                                    .frame(width: 320, height: 180)
                                Image("rpgIcon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 84, height: 84)
                            }
                        })
                        Button(action: {}, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color("Blue-Gray"))
                                    .frame(width: 320, height: 180)
                                Image("openWorldIcon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 84, height: 84)
                            }
                        })
                    }
                } else {
                    HStack{
                        Button(action: {}, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color("Blue-Gray"))
                                    .frame(width: 160, height: 90)
                                Image("fps")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 42, height: 42)
                            }
                        })
                        Button(action: {}, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color("Blue-Gray"))
                                    .frame(width: 160, height: 90)
                                Image("rpgIcon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 42, height: 42)
                            }
                        })
                        Button(action: {}, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color("Blue-Gray"))
                                    .frame(width: 160, height: 90)
                                Image("openWorldIcon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 42, height: 42)
                            }
                        })
                    }
                }
                
            }
            
            Text("RECOMENDADOS PARA TI")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top, 25)
                .padding(.bottom, 10)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    Button(
                        action: {
                            watchGame(name: "Abzu")
                        },
                        label: {
                            Image("battleField")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 240, height: 135)
                    })
                    Button(
                        action: {
                            watchGame(name: "Crash Bandicoot")
                        },
                        label: {
                            Image("uncharted4")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 240, height: 135)
                    })
                    Button(
                        action: {
                            watchGame(name: "Death Stranding")
                        },
                        label: {
                            Image("battleField")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 240, height: 135)
                    })
                }
            }
            
            Text("VIDEOS QUE PODRÍAN GUSTARTE")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top, 25)
                .padding(.bottom, 10)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    Button(
                        action: {
                            watchGame(name: "Cuphead")
                        },
                        label: {
                            Image("lastOfUs")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 240, height: 135)
                    })
                    Button(
                        action: {
                            watchGame(name: "Hades")
                        },
                        label: {
                            Image("destinyComplete")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 240, height: 135)
                    })
                    Button(
                        action: {
                            watchGame(name: "Grand Theft Auto")
                        },
                        label: {
                            Image("destinyComplete")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 240, height: 135)
                    })
                }
            }
            Color.clear.frame(width: 1, height: 8, alignment: .center)
        }
        
        NavigationLink(
            destination: GameView(
                url: url,
                titulo: titulo,
                studio: studio,
                calificacion: calificacion,
                añoPublicacion: añoPublicacion,
                descripcion: descripcion,
                tags: tags,
                imgsUrl: imgsUrl),
            isActive: $isGameViewActive,
            label: {
                EmptyView()
            }
        )
    }
    
    func watchGame(name:String) {
        
        juegoEncontrado.search(gameName: name)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
            
            print("Cantidad E:\(juegoEncontrado.gameInfo.count)")
            
            if juegoEncontrado.gameInfo.count == 0 {
                
                print("No se encontro ningun juego llamado \(name)")
                isGameInfoEmpty = true
                
            } else {
                url = juegoEncontrado.gameInfo[0].videosUrls.mobile
                titulo = juegoEncontrado.gameInfo[0].title
                studio = juegoEncontrado.gameInfo[0].studio
                calificacion = juegoEncontrado.gameInfo[0].contentRaiting
                añoPublicacion = juegoEncontrado.gameInfo[0].publicationYear
                descripcion = juegoEncontrado.gameInfo[0].description
                tags = juegoEncontrado.gameInfo[0].tags
                imgsUrl = juegoEncontrado.gameInfo[0].galleryImages
                
                isGameViewActive = true
            }
        }
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
