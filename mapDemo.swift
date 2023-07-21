//
//  mapDemo.swift
//  BootCamp
//
//  Created by man ching chan on 21/7/2023.
//

import SwiftUI
import MapKit




struct mapDemo: View{
    
    @StateObject private var viewModel = ContentViewModel()
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 22.302, longitude: 114.17), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    

    
    var body: some View {
        
        VStack{
            Map(coordinateRegion:  $region,showsUserLocation: true)
                .onAppear{
                    viewModel.checkIfLocationEnabled()
                }
                
        }
        .ignoresSafeArea()
        
    }
}



struct mapDemo_Previews: PreviewProvider {
    static var previews: some View {
        mapDemo()
    }
}








final class ContentViewModel:NSObject,ObservableObject,CLLocationManagerDelegate{
    
    var locationManager: CLLocationManager!
    

    
   func checkIfLocationEnabled(){
        
        if CLLocationManager.locationServicesEnabled(){
            
            locationManager = CLLocationManager()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.delegate = self
            
            checkLocationAuthorization()
        }
        else{
            print("no location")
        }
    }
    
    private func checkLocationAuthorization(){
        
        guard let locationManager = locationManager else {return}
        
        switch locationManager.authorizationStatus{
            
        case .notDetermined:
            print(".notdetermined")
            print("do something")
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print(".restried")
        case .denied:
            print(".denied")
        case .authorizedAlways:
            print(".authorizationalways")
        case .authorizedWhenInUse:
            print(".authorizationinuse")
        @unknown default:
            print(".unknown")
        }
    }
    
    

    
}
