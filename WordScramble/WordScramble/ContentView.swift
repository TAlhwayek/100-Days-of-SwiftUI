//
//  ContentView.swift
//  WordScramble
//
//  Created by Tony Alhwayek on 1/5/24.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    @State private var score = 0
    
    var body: some View {
        NavigationStack {
            
            // Challenge #3
            Text("Score: \(score)")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            List {
                Section("Enter word") {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                    
                }
                
                Section("Used words") {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
            .alert(errorTitle, isPresented: $showingError) {
                Button("OK") { }
            } message: {
                Text(errorMessage)
            }
            .toolbar {
                Button("New Game") {
                    startGame()
                }
            }
        }
    }
    
    func addNewWord() {
        // Trim word and check if it's not empty
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else { return }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from \(rootWord)")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't make them up, you know!")
            return
        }
        
        guard isShort(word: answer) else {
            wordError(title: "Word is too short", message: "Words should be three letters or greater")
            return
        }
        
        guard isRootWord(word: answer) else {
            wordError(title: "No", message: "Don't use the starting word")
            return
        }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        
        calculateScore(word: answer)
        newWord = ""
    }
    
    func startGame() {
        // Find and store all the words in an array
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
        // If can't find/load text file
        fatalError("Could not load start.txt from bundle.")
    }
    
    // Check if word hasn't been used already
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    // Check if submitted word exists in root word
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        
        return true
    }
    
    // Check if submitted word is real
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
    
    // Challenge #1 functions
    func isShort(word: String) -> Bool {
        return word.count >= 3
    }
    
    // Check if submitted word is the default root word
    func isRootWord(word: String) -> Bool {
        return !(word == rootWord)
    }
    
    // Challenge #3
    func calculateScore(word: String) {
        score += word.count
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    
}

#Preview {
    ContentView()
}
