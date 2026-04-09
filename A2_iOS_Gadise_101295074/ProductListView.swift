//
//ProductListView.swift
//  A2_iOS_Gadise_101295074
//  Created by Gadise Oli on 2026-04-09.
//
import SwiftUI
import CoreData

struct ProductListView: View {

    @FetchRequest(sortDescriptors: [])
    private var products: FetchedResults<Product>

    var body: some View {
        List {
            ForEach(products) { product in
                VStack(alignment: .leading) {
                    Text(product.productName ?? "")
                        .font(.headline)
                    Text(product.productDescription ?? "")
                }
            }
        }
        .navigationTitle("All Products")
    }
}
