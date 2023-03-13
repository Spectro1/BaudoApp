//
//  Home.swift
//  BaudoAP
//
//  Created by Codez on 11/03/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct Home: View {
    
    @ObservedObject var contentImage = ContentImage()
    @State var selectedTab = 0
    var body: some View {
       
        
        NavigationView{
               ScrollView {
                    Picker("", selection: $selectedTab) {
                                    Text("Imagen").tag(0)
                                    Text("Video").tag(1)
                                    Text("Podcast").tag(2)
                                }.padding()
                                .pickerStyle(SegmentedPickerStyle())

                                switch(selectedTab) {
                                    case 0: Images()
                                    case 1: Navegantes()
                                    case 2: Tienda()
                                
                                default:
                                    Images()
                                }

                }
               .refreshable {
                   contentImage.fetchposts()
                   }
        }
    }
}


    struct Images: View {
        @ObservedObject var contentImage = ContentImage()
        var body: some View {
            ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                ForEach(contentImage.posts) { post in
                        NavigationLink(destination: PostCardImageDetailView(model: post) , label: {
                        PostCardImage(model: post) } )
                    
                }
            }
        }
    }




struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            
    }
}
