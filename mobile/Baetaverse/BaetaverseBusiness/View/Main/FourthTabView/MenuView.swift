//
//  MoreView.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/05.
//

import SwiftUI

struct MoreView: View {
    
    @State var name: String = "DemoForwarder"
    @State var profileImage: Image = Image("demoProfileImage")
    
    var body: some View {
        NavigationView {
            ScrollView {
                MoreContentView(name: $name, profileImage: $profileImage)
            }
            .navigationTitle(Text("더보기"))
            
        }
    }
    
}

private struct MoreContentView: View {
    
    @Binding var name: String
    @Binding var profileImage: Image
    
    var body: some View {
        VStack {
            MoreProfileView(
                name: $name,
                profileImage: $profileImage
            )
            Divider()
            List {
                NavigationLink(destination: Text("Hello World")) {
                    Text("마이페이지")
                }
                NavigationLink(destination: Text("Hello World")) {
                    Text("받은견적요청서")
                }
                NavigationLink(destination: Text("Hello World")) {
                    Text("상담내역")
                }
                NavigationLink(destination: Text("Hello World")) {
                    Text("고객센터")
                }
            }
        }
    }
    
}

struct MoreView_Previews: PreviewProvider {
    
    static var previews: some View {
        MoreView()
    }
    
}
