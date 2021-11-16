//
//  ContentView.swift
//  GameSteam
//
//  Created by José Flores on 14/10/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Spacer()
                Color(red: 21/255, green: 31/255, blue: 59/255, opacity: 1.0)
                    .ignoresSafeArea()
                
                VStack{
                    Image("appLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250)
                        .padding(.bottom , 42)
                    InicioYRegistroView()
                }
            }
            .navigationBarHidden(true)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct InicioYRegistroView: View {
    @State var tipoInicioSesion = true
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button("INICIA SESIÓN") {
                    tipoInicioSesion = true
                    print("Pantalla inicio sesion")
                }
                .foregroundColor(tipoInicioSesion ? .white : .gray)
                Spacer()
                Button("REGÍSTRATE") {
                    tipoInicioSesion = false
                    print("Pantalla de registro")
                }
                .foregroundColor(tipoInicioSesion ? .gray : .white)
                Spacer()
            }
            Spacer(minLength: 42)
            if tipoInicioSesion == true {
                InicioSesionView()
            } else {
                RegistroView()
            }
        }
    }
}

struct InicioSesionView: View {
    
    @State var correo = ""
    @State var contraseña = ""
    @State var isPantallaHomeActive = false
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading) {
                
                Text("Correo Electrónico")
                    .foregroundColor(Color("Dark-Cian"))
                
                ZStack(alignment: .leading) {
                    if correo.isEmpty {
                        Text("ejemplo@gmail.com")
                            .font(.caption)
                            .foregroundColor(Color("Light-Gray"))
                            .padding(.top)
                    }
                    TextField("", text: $correo)
                        .foregroundColor(.white)
                }
                
                Divider()
                    .frame(height: 1)
                    .background(Color("Dark-Cian"))
                    .padding(.bottom)
                
                Text("Contraseña")
                    .foregroundColor(.white)
                
                ZStack(alignment: .leading) {
                    if contraseña.isEmpty {
                        Text("Escribe tu contraseña")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    SecureField("", text: $contraseña)
                        .foregroundColor(.white)
                }
                
                Divider()
                    .frame(height: 1)
                    .background(Color(.white))
                    .padding(.bottom)
                
                Text("¿Olvidaste tu contraseña?")
                    .font(.footnote)
                    .frame(width: 337, alignment: .trailing)
                    .foregroundColor(Color("Dark-Cian"))
                    .padding(.bottom)
                
                Button(action: iniciarSesion, label: {
                    Text("INICIAR SESIÓN")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6.0)
                                    .stroke(Color("Dark-Cian"), lineWidth: 1.0)
                                    .shadow(color: .white, radius: 6))
                })
                
                Text("Inicia sesión con redes sociales")
                    .foregroundColor(.white)
                    .padding(.top, 66.0)
                    .padding(.bottom, 22.0)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                HStack{
                    Button(action: iniciarSesionFacebook, label: {
                        Text("Facebook")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                            .background(Color("Blue-Gray"))
                            .cornerRadius(6)
                    })
                    Button(action: iniciarSesionTwitter, label: {
                        Text("Twitter")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                            .background(Color("Blue-Gray"))
                            .cornerRadius(6)
                    })
                }
                
            }.padding(.horizontal, 77.0)
            
            NavigationLink(
                destination: Home(),
                isActive: $isPantallaHomeActive,
                label: {
                EmptyView()
            })
        }
    }
    
    func iniciarSesion() {
        print("Estoy iniciando sesion")
        isPantallaHomeActive = true
    }
}



func iniciarSesionFacebook() {
    print("Estoy iniciando sesion con Facebook")
}

func iniciarSesionTwitter() {
    print("Estoy iniciando sesion con Twitter")
}

struct RegistroView: View {
    @State var correo = ""
    @State var contraseña = ""
    @State var confirmarContraseña = ""

    var body: some View {
        ScrollView {
            VStack(alignment:.center){
                Text("Elije una foto de perfil")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("Puedes cambiar o elegirla más adelante")
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                    .padding(.bottom)
                
                Button(action: tomarFoto, label: {
                    ZStack {
                        Image("profilePic")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                        Image(systemName: "camera")
                            .foregroundColor(.white)
                    }
                }).padding(.bottom)
            }
            
            VStack {
                
                VStack(alignment: .leading){
                    Text("Correo Electrónico*")
                        .foregroundColor(Color("Dark-Cian"))
                        .frame(width: 337, alignment: .leading)

                    ZStack(alignment: .leading) {
                        if correo.isEmpty {
                            Text("ejemplo@gmail.com")
                                .font(.caption)
                                .foregroundColor(Color("Light-Gray"))
                                .padding(.top)
                        }
                        TextField("", text: $correo)
                            .foregroundColor(.white)
                    }

                    Divider()
                        .frame(height: 1)
                        .background(Color("Dark-Cian"))
                        .padding(.bottom)
                    
                    Text("Contraseña")
                        .foregroundColor(.white)

                    ZStack(alignment: .leading) {
                        if contraseña.isEmpty {
                            Text("Escribe tu contraseña")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        SecureField("", text: $contraseña)
                            .foregroundColor(.white)
                    }

                    Divider()
                        .frame(height: 1)
                        .background(Color(.white))
                        .padding(.bottom)

                    Text("Confirmar contraseña")
                        .foregroundColor(.white)

                    ZStack(alignment: .leading) {
                        if confirmarContraseña.isEmpty {
                            Text("Vuelve a escribir tu contraseña")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        SecureField("", text: $confirmarContraseña)
                            .foregroundColor(.white)
                    }

                    Divider()
                        .frame(height: 1)
                        .background(Color(.white))
                        .padding(.bottom)

                }


                Button(action: registrate, label: {
                    Text("REGISTRATE")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6.0)
                                    .stroke(Color("Dark-Cian"), lineWidth: 1.0)
                                    .shadow(color: .white, radius: 6))
                })

                Text("Inicia sesión con redes sociales")
                    .foregroundColor(.white)
                    .padding(.top, 30)
                    .frame(maxWidth: .infinity, alignment: .center)

                HStack{
                    Button(action: iniciarSesionFacebook, label: {
                        Text("Facebook")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                            .background(Color("Blue-Gray"))
                            .cornerRadius(6)
                    })
                    Button(action: iniciarSesionTwitter, label: {
                        Text("Twitter")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                            .background(Color("Blue-Gray"))
                            .cornerRadius(6)
                    })
                }

            }.padding(.horizontal, 77.0)
        }
    }
}

func registrate(){
    print("Me estoy registrando")
}

func tomarFoto() {
    print("Voy a tomar fotografía de perfil")
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPad Pro (9.7-inch)")
    }
}
