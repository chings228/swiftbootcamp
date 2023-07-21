//
//  mapDemo.swift
//  BootCamp
//
//  Created by man ching chan on 21/7/2023.
//

import SwiftUI
import MapKit




struct mapDemo: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 22.2, longitude: 114.11), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    

    
    var body: some View {
        
        VStack{
            Map(coordinateRegion:  $region)
                
        }
        .ignoresSafeArea()
        
    }
}



struct mapDemo_Previews: PreviewProvider {
    static var previews: some View {
        mapDemo()
    }
}
