//
//SearchView.swift
//  A2_iOS_Gadise_101295074
//  Created by Gadise Oli on 2026-04-09.
//
import SwiftUI
import CoreData

struct SearchView: View {

    @Environment(\.managedObjectContext) private var context
    @State private var searchText = ""

    var body: some View {
        VStack {
            TextField("Search...", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            ProductSearchResults(searchText: searchText)
        }
        .navigationTitle("Search Products")
    }
}

struct ProductSearchResults: View {

    var searchText: String

    @FetchRequest var products: FetchedResults<Product>

    init(searchText: String) {
        self.searchText = searchText
        _products = FetchRequest(
            sortDescriptors: [],
            predicate: searchText.isEmpty ? nil :
                NSPredicate(
                    format: "productName CONTAINS[cd] %@ OR productDescription CONTAINS[cd] %@",
                    searchText, searchText
                )
        )
    }

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
    }
}
