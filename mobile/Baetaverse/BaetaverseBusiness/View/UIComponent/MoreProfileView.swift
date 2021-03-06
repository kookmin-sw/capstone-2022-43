//
//  MoreProfileView.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/10.
//

import SwiftUI

struct MoreProfileView: View {
    
    @Binding var name: String
    @Binding var profileImage: Image
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(UIColor.systemTeal))
            VStack(alignment: .leading) {
                HStack {
                    profileImage
                        .clipShape(Circle())
                        .overlay {
                            Circle().stroke(.gray, lineWidth: 4)
                        }
                    Text(name)
                    Spacer()
                }
//                NavigationLink(destination: Text("Hello World")) {
//                    Spacer()
//                    Text("자세히보기")
//                    Spacer()
//                }
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
    }
    
}

struct MoreProfileView_Previews: PreviewProvider {
    
    static var previews: some View {
        MoreProfileView(
            name: .constant("DemoForwardingServiceCorporation"),
            profileImage: .constant(Image("demoProfileImage"))
        )
    }
    
}
