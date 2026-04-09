//
//  ContentView.swift
//  A2_iOS_Gadise_101295074
//
//  Created by Gadise Oli on 2026-04-09.
//

import SwiftUI
import CoreData

struct ContentView: View {

    @FetchRequest(sortDescriptors: [])
    private var products: FetchedResults<Product>

    @State private var index = 0

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {

                if products.count > 0 {
                    Text(products[index].productName ?? "")
                        .font(.title)

                    Text(products[index].productDescription ?? "")
                    Text("Price: $\(products[index].productPrice)")
                    Text("Provider: \(products[index].productProvider ?? "")")

                    HStack {
                        Button("Previous") {
                            if index > 0 { index -= 1 }
                        }
                        Button("Next") {
                            if index < products.count - 1 { index += 1 }
                        }
                    }
                }

                Divider()
              //Add previous and next navigation controls

                NavigationLink("View Product List", destination: ProductListView())
                NavigationLink("Search Products", destination: SearchView())
                NavigationLink("Add Product", destination: AddProductView())
            }
            .padding()
            .navigationTitle("Product Viewer")
        }
    }
}
