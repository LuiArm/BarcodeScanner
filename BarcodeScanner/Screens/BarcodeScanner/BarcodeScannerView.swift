//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by luis armendariz on 9/20/23.
//

import SwiftUI



struct BarcodeScannerView: View {
    //use stateobject when iniating a new view model vs passing in view model from previous screen use observedobject
    @StateObject var viewModel = BarcodeScannerViewModel()
    
    var body: some View {
        NavigationStack{
            VStack {
                ScannerView(scannedCode: $viewModel.scannedCode, alertItem: $viewModel.alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                Spacer().frame(height: 60)
                
                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                    .font(.title)
                
                Text(viewModel.statusText)
                    .bold()
                    .font(.largeTitle)
                    .foregroundStyle(viewModel.statusTextColor)
                    .padding()
            }
            .navigationTitle("Barcode Scanner")
            .alert(item: $viewModel.alertItem){ alertItem in
                Alert(title: Text(alertItem.title), message: Text(alertItem.message),dismissButton: alertItem.dismissButton)
            }
            
        }
    }
}

#Preview {
    BarcodeScannerView()
}
