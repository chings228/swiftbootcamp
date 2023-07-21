//
//  TimerDemo.swift
//  BootCamp
//
//  Created by man ching chan on 21/7/2023.
//

import SwiftUI

struct TimerDemo: View {
    
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//
//    @State var currentDate:Date = Date()
//    var dateFormatter:DateFormatter{
//
//        let formatter = DateFormatter()
//        formatter.timeStyle = .medium
//        formatter.dateStyle = .medium
//        return formatter
//    }
    
    
    @State var count:Int =  10
    @State var finishedText : String? = nil
    
    
    var body: some View {
       
        ZStack {
            
            RadialGradient(gradient: Gradient(colors: [Color.black,Color.gray]), center: .center, startRadius: 5, endRadius: 500)
                .ignoresSafeArea()
            
            
            Text(finishedText ?? "\(count)")
                .font(.system(size: 100, weight: .semibold, design: .rounded))
                .foregroundColor(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
            
        }
        .onReceive(timer) { value in
            
            if count < 1{
                finishedText = "Wow"
            }
            else{
                count -= 1
            }
        }
        

        
        
    }
}

struct TimerDemo_Previews: PreviewProvider {
    static var previews: some View {
        TimerDemo()
    }
}
