//
//  PinterestGridView.swift
//  PinterestGrid
//
//  Created by Manuchim Oliver on 22/02/2023.
//

import SwiftUI

struct GridItem: Identifiable {
    let id = UUID()
    let height: CGFloat
    let imgString: String
}

struct PinterestGridView: View {
    
    struct Column: Identifiable {
        let id = UUID()
        var gridItems = [GridItem]()
    }
    
    let columnss: [Column]
    
    let spacing: CGFloat
    let horizontalPadding: CGFloat
    
    init(gridItems: [GridItem], numOfColumns: Int, spacing: CGFloat = 20, horizontalPadding: CGFloat = 20){
        self.spacing = spacing
        self.horizontalPadding = horizontalPadding
        
        var columnss = [Column]()
        for _ in 0 ..< numOfColumns {
            columnss.append(Column())
        }
        
        var columnsHeight = Array<CGFloat>(repeating: 0, count: numOfColumns)
        
        for gridItem in gridItems {
            var smallestColumnIndex = 0
            var smallestHeight = columnsHeight.first!
            for i in 1 ..< columnsHeight.count{
                let currHeight = columnsHeight[i]
                if currHeight < smallestHeight {
                    smallestHeight = currHeight
                    smallestColumnIndex = i

                }
            }
            
            columnss[smallestColumnIndex].gridItems.append(gridItem)
            columnsHeight[smallestColumnIndex] += gridItem.height
        }
        self.columnss = columnss
    }
    
    var body: some View {
        HStack (alignment: .top, spacing: spacing){
            ForEach(columnss){ column in
                LazyVStack(spacing: spacing) {
                    ForEach(column.gridItems) { gridItem in
                        getItemView(gridItem: gridItem)
                    }
                }
            }
        }
        .padding(.horizontal, horizontalPadding)
    }
    func getItemView(gridItem: GridItem) -> some View {
        ZStack{
            GeometryReader{ reader in
                Image(gridItem.imgString)
                    .resizable()
                    .scaledToFill()
                    .frame(width: reader.size.width, height: reader.size.height, alignment: .center)
            }
        }
        .frame(height: gridItem.height)
        .frame(maxWidth: .infinity)
        .clipShape(RoundedRectangle(cornerRadius: 13))
    }
}

struct PinterestGridView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
