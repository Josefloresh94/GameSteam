//
//  ProfileView.swift
//  GameSteam
//
//  Created by José Flores on 19/10/21.
//

import SwiftUI

struct ProfileView: View {
    
    @State var nombreUsuario = "Lorem"
    
    var body: some View {
        ZStack {
            Color("Marine")
                .ignoresSafeArea()
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            VStack {
                Text("Perfil")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, alignment: .center)
                    .padding()
                
                VStack {
                    Image("profilePic")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 118, height: 118)
                        .clipShape(Circle())
                    
                    Text(nombreUsuario)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                }.padding(EdgeInsets(top: 16, leading: 0, bottom: 32, trailing: 0))
                
                Text("Ajustes")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 18)
                
                ModuloAjustes()
                
                Spacer()
                
            }
        }.onAppear(perform: {
            print("Revisando si tengo datos de usuario en mis userDefaults")
        })
    }
}

struct ModuloAjustes: View {
    
    @State var isToggleOn = true
    @State var isEditProfileViewActive = false
    
    var body: some View {
        VStack(spacing: 3) {
            
            Button(action: {}, label: {
                HStack {
                    Text("Cuenta")
                        .foregroundColor(.white)
                    Spacer()
                    Text(">")
                        .foregroundColor(.white)
                }.padding()
            }).background(Color("Blue-Gray"))
                .clipShape(RoundedRectangle(cornerRadius: 1))
            
            Button(action: {}, label: {
                HStack {
                    Text("Notificaciones")
                        .foregroundColor(.white)
                    Spacer()
                    Toggle("", isOn: $isToggleOn)
                }.padding()
            }).background(Color("Blue-Gray"))
                .clipShape(RoundedRectangle(cornerRadius: 1))
            
            Button(
                action: {
                    isEditProfileViewActive = true
                },
                label: {
                HStack {
                    Text("Editar perfil")
                        .foregroundColor(.white)
                    Spacer()
                    Text(">")
                        .foregroundColor(.white)
                }.padding()
            }).background(Color("Blue-Gray"))
                .clipShape(RoundedRectangle(cornerRadius: 1))
            
            Button(action: {}, label: {
                HStack {
                    Text("Califica esta aplicación")
                        .foregroundColor(.white)
                    Spacer()
                    Text(">")
                        .foregroundColor(.white)
                }.padding()
            }).background(Color("Blue-Gray"))
                .clipShape(RoundedRectangle(cornerRadius: 1))
            
            NavigationLink(
                destination: EditProfileView(),
                isActive: $isEditProfileViewActive,
                label: {
                    EmptyView()
                })
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
