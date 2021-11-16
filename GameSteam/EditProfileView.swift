//
//  EditProfileView.swift
//  GameSteam
//
//  Created by José Flores on 20/10/21.
//

import SwiftUI

struct EditProfileView: View {
    var body: some View {
        ZStack {
            Color("Marine")
                .ignoresSafeArea()
            
            ScrollView{
                VStack{
                    Button(
                        action: {},
                        label: {
                            ZStack {
                                Image("profilePic")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 118, height: 118)
                                .clipShape(Circle())
                                
                                Image(systemName: "camera")
                                    .foregroundColor(.white)
                            }
                        })
                }.padding(.bottom, 18)
                
                ModuloEditar()
            }
        }
    }
}

struct ModuloEditar: View {
    
    @State var correo:String = ""
    @State var contraseña:String = ""
    @State var nombre:String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Correo electrónico")
                .foregroundColor(Color("Dark-Cian"))
            
            ZStack(alignment: .leading){
                if correo.isEmpty {
                    Text("ejemplo@gmail.com")
                        .font(.caption)
                        .foregroundColor(Color(red:174/255, green: 177/255, blue: 185/255, opacity: 1))
                }
                TextField("", text: $correo).foregroundColor(.white)
            }
            Divider()
                .frame(height:1)
                .background(Color("Dark-Cian"))
                .padding(.bottom)
            
            Text("Contraseña")
                .foregroundColor(.white)
            
            ZStack(alignment: .leading){
                if contraseña.isEmpty {
                    Text("Introduce tu contraseña")
                        .font(.caption)
                        .foregroundColor(Color(red:174/255, green: 177/255, blue: 185/255, opacity: 1))
                }
                SecureField("", text: $contraseña).foregroundColor(.white)
            }
            Divider()
                .frame(height:1)
                .background(.white)
                .padding(.bottom)
            
            Text("Nombre")
                .frame(width:337, alignment: .leading)
                .foregroundColor(.white)
            
            ZStack(alignment: .leading){
                if nombre.isEmpty {
                    Text("Introduce tu nombre de usuario")
                        .font(.caption)
                        .foregroundColor(Color(red:174/255, green: 177/255, blue: 185/255, opacity: 1))
                }
                TextField("", text: $nombre).foregroundColor(.white)
            }
            Divider()
                .frame(height:1)
                .background(Color("Dark-Cian"))
                .padding(.bottom, 32)
            
            Button(
                action: {
                    actualizarDatos()
                    
                },
                label: {
                    Text("ACTUALIZAR DATOS")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame( maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6)
                        .stroke(Color("Dark-Cian"), lineWidth: 3).shadow(color: .white, radius: 6))
                })
        }.padding(.horizontal, 42)
    }
    
    func actualizarDatos() {
        let objetoActualizadorDatos = SaveData()
        
        let resultado = objetoActualizadorDatos.guardarDatos(correo: correo, contraseña: contraseña, nombre: nombre)
        print("Se guardaron los datos con exito? \(resultado)")
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
