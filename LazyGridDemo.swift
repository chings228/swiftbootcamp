//
//  LazyGridDemo.swift
//  BootCamp
//
//  Created by man ching chan on 21/7/2023.
//

import SwiftUI

struct LazyGridDemo: View {
    
    let columns:[GridItem] = [
    
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil)
    ]
    
    
    var body: some View {
        
        ScrollView{
            
            LazyVGrid(columns: columns) {
                
                ForEach(0..<200){index in
                    
                    Rectangle()
                        .frame(height:50)
                    
                }
            }
        }
        .ignoresSafeArea()
        .offset(y:100)
        
        
    }
}

struct LazyGridDemo_Previews: PreviewProvider {
    static var previews: some View {
        LazyGridDemo()
    }
}
