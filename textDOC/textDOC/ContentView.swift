//
//  ContentView.swift
//  textDOC
//
//  Created by Andrey Zhuravlev on 2024-07-31.
//

import SwiftUI
import Translation
struct ContentView: View {
    @Binding var document: textDOCDocument
    @State private var translationVisible = false
    
    var body: some View {
        if #available(macOS 15.0, *) {
            TextEditor(text: $document.text)
                .writingToolsBehavior(.complete)
                .font(.system(size: 16.0))
                .cornerRadius(13)
                .border(.green .gradient)
                .translationPresentation(isPresented: $translationVisible, text: document.text)
            Button("Translate") {
                translationVisible.toggle()
            }
            
        } else {
            TextEditor(text: $document.text)
                .font(.system(size: 16.0))
        }
        HStack {
            
            Label("Replace: ", systemImage: /*@START_MENU_TOKEN@*/"42.circle"/*@END_MENU_TOKEN@*/)
            
            Button("Semicolon with comma") {
                var txt = document.text
                txt = replace(text: txt)
                document.text = txt
            }
            
            Button("Comma with dot") {
                var txt = document.text
                txt = replace1(text: txt)
                document.text = txt
            }
            
            Button("CR+LF with LF") {
                var txt = document.text
                txt = replace2(text: txt)
                document.text = txt
            }
            
            
        }
        HStack {
            Button("Sort lines separated by LF") {
                var txt = document.text
                txt = sort_text(intext: txt)
                document.text = txt
            }
            
            Button("Sort CSV with header") {
                var txt = document.text
                txt = sort_csv(intext: txt)
                document.text = txt
            }
 
            
            
        }
 //       .padding()
    }
}

#Preview {
    ContentView(document: .constant(textDOCDocument()))
        .frame(width: 7.0, height: 7.0)
        .accessibilityAddTraits([.isSummaryElement])
        .accessibilityLabel(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/)
}
