//
//  ContentView.swift
//  PinterestGrid
//
//  Created by Manuchim Oliver on 22/02/2023.
//

import SwiftUI

struct ContentView: View {
    let gridItems = [
        GridItem(height: 450, imgString: "1"),
        GridItem(height: 243, imgString: "2"),
        GridItem(height: 353, imgString: "3"),
        GridItem(height: 280, imgString: "4"),
        GridItem(height: 334, imgString: "5"),
        GridItem(height: 115, imgString: "6"),
        GridItem(height: 350, imgString: "7"),
        GridItem(height: 288, imgString: "8"),
        GridItem(height: 252, imgString: "9"),
        GridItem(height: 119, imgString: "10"),
        GridItem(height: 211, imgString: "11"),
        GridItem(height: 341, imgString: "12"),
        GridItem(height: 179, imgString: "13"),
        GridItem(height: 277, imgString: "14"),
        GridItem(height: 299, imgString: "15"),
        GridItem(height: 370, imgString: "16"),
        GridItem(height: 365, imgString: "17"),
        GridItem(height: 226, imgString: "18"),
    ]
    
    @State private var columns = 3
    var body: some View {
        return NavigationView{
            ScrollView {
               PinterestGridView( gridItems: gridItems, numOfColumns: columns, spacing: 20, horizontalPadding: 15)
           }
            .navigationBarItems(leading: removeBtn, trailing: addBtn)
            .navigationTitle("Pinterest Grid")
        }
        
    }
    
    var removeBtn: some View {
        Button(action: {
            columns -= 1
        }){
            Text("Remove Column")
        }
        .disabled(columns == 1)
    }
    
    var addBtn: some View {
        Button(action: {
            columns += 1
        }){
            Text("Add Column")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
