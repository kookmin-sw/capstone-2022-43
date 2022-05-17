//
//  MoreView.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/05.
//

import SwiftUI

struct MoreView: View {
    
    @StateObject private var viewModel = MenuViewModel()
    
    @State var name: String = "DemoForwarder"
    @State var profileImage: Image = Image("demoProfileImage")
    @Binding var mainViewIsPresented: Bool
    
    var body: some View {
        NavigationView {
            ScrollView {
                MoreContentView(
                    name: $name,
                    profileImage: $profileImage,
                    mainViewIsPresented: $mainViewIsPresented,
                    viewModel: viewModel
                )
            }
            .navigationTitle(Text("더보기"))
        }
    }
    
}

private struct MoreContentView: View {
    
    @Binding var name: String
    @Binding var profileImage: Image
    @Binding var mainViewIsPresented: Bool
    
    let viewModel: MenuViewModel
    
    var body: some View {
        VStack {
            MoreProfileView(
                name: $name,
                profileImage: $profileImage
            )
            AutoLazyVGrid(column: 3, spacing: 20) {
                NavigationLink(destination: Text("Hello World")) {
                    MoreShortcutContentView(
                        label: "견적요청서",
                        systemImage: "doc.text"
                    )
                }
                NavigationLink(destination: Text("Hello World")) {
                    MoreShortcutContentView(
                        label: "상담내역",
                        systemImage: "message"
                    )
                }
                NavigationLink(destination: Text("Hello World")) {
                    MoreShortcutContentView(
                        label: "고객센터",
                        systemImage: "face.smiling"
                    )
                }
                NavigationLink(destination: Text("Hello World")) {
                    MoreShortcutContentView(
                        label: "알림설정",
                        systemImage: "bell"
                    )
                }
                Button(action: {
                    viewModel.logout()
                    mainViewIsPresented.toggle()
                }) {
                    MoreShortcutContentView(
                        label: "로그아웃",
                        systemImage: "person.crop.circle.badge.xmark"
                    )
                }
            }
            .padding()
            .imageScale(.large)
        }
    }
    
}

private struct MoreShortcutContentView: View {
    
    let label: String
    let systemImage: String
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: systemImage)
                .font(.title2)
            Text(label)
        }
        .imageScale(.large)
    }
    
}

struct MoreView_Previews: PreviewProvider {
    
    static var previews: some View {
        MoreView(mainViewIsPresented: .constant(true))
            .previewInterfaceOrientation(.portrait)
    }
    
}
