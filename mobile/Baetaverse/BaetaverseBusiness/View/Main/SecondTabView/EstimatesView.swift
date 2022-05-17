//
//  EstimatesView.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/17.
//

import SwiftUI

struct EstimatesView: View {
    
    var body: some View {
        NavigationView {
            EstimatesContentView()
                .navigationTitle("견적서")
        }
    }
    
}

private struct EstimatesContentView: View {

    var body: some View {
        List {
            ForEach(0..<5) { data in
                Text(String(data))
            }
        }
    }

}

struct EstimatesView_Previews: PreviewProvider {
    static var previews: some View {
        EstimatesView()
    }
}
