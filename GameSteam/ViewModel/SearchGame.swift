//
//  SearchGame.swift
//  GameSteam
//
//  Created by José Flores on 19/10/21.
//

import Foundation

class SearchGame: ObservableObject {
    
    @Published var gameInfo = [Game]()
    
    func search(gameName:String){
        
        gameInfo.removeAll()
        
        let gameNameSpaces = gameName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        let url = URL(string: "https://gamestream-api.herokuapp.com/api/search?contains=\(gameNameSpaces ?? "cuphead")")!
    
        var request = URLRequest(url: url)
    
        //Tipo de método de llamada
        request.httpMethod = "GET"
    
        //Inicio de sesión
        URLSession.shared.dataTask(with: request) { data, response, error in
            do{
                if let jsonData = data {
                    print("Tamaño del Json \(jsonData)")
                    let decodeData = try
                    JSONDecoder().decode(Resultados.self, from: jsonData)
    
                    DispatchQueue.main.async {
                        self.gameInfo.append(contentsOf: decodeData.results)
                    }
                }
            }catch{
                print("Error: \(error)")
            }
        }.resume()
    }
}
