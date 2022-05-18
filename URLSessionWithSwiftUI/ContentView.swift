//
//  ContentView.swift
//  URLSessionWithSwiftUI
//
//  Created by Eduardo Ceron on 25/10/21.
// En esta app vamos a hacer un llamado a un url para despues serializar un json y mostrar los datos en la app

/*
 Primero se crea la capa de conexón que nos va a permitir gestionar las llamadas a servicio REST, URl, decarga de imagenes, etc.
 - creamos un archivo swift lo llamamos NetworkManager
 */

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model = PostListViewModel()
    
    var body: some View {
        List(model.posts){
            Text($0.title)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
