//
//  textDOCApp.swift
//  textDOC
//
//  Created by Andrey Zhuravlev on 2024-07-31.
//

import SwiftUI

@main
struct textDOCApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: textDOCDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
func replace(text: String) -> String {
   let text1 = text.replacing(";", with: ",")
    return text1
}
func replace1(text: String) -> String {
   let text1 = text.replacing(",", with: ".")
    return text1
}
func replace2(text: String) -> String {
   let text1 = text.replacing("\r\n", with: "\n")
    return text1
}
func sort_text(intext: String) ->  String {
    var outtext: String = ""
    var txt1: [Substring] = []
    txt1 = intext.split(separator: "\n")
    var txt2: [String] = []
    for i in txt1 {
        txt2.append(String(i))
    }
    for i in txt2.sorted() {
      outtext += i+"\n"
    }
    return outtext
}
func sort_csv(intext: String) ->  String {
   var outtext: String = ""
   var txt1: [Substring] = []
   txt1 = intext.split(separator: "\n")
   var txt2: [String] = []
   for i in txt1 {
       txt2.append(String(i))
   }
outtext = txt2[0] + "\n"
txt2.remove(at: 0)

   for i in txt2.sorted() {
     outtext += i+"\n"
   }
   return outtext
}
