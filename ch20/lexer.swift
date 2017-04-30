import Foundation

enum Token {
    case number(Int)
    case plus
    // Bronze challenge
    case minus
    // Gold challenge
    case multiply
    case divide
}

class Lexer {
    enum Error: Swift.Error {
        case invalidCharacter(Character, Int)
        case invalidToken(Character, Int)
    }
    let input: String.CharacterView
    var position: String.CharacterView.Index

    init(input: String) {
        self.input = input.characters
        self.position = self.input.startIndex
    }

    func peek() -> Character? {
        guard position < input.endIndex else { return nil }
        return input[position]
    }
    func advance() {
        assert(position < input.endIndex, "Cannot advance past endIndex!")
        position = input.index(after: position)
    }
    func lex() throws -> [Token] {
        var tokens = [Token]()
        while let nextCharacter = peek() {
            let lastToken = tokens.last
            let p = input.distance(from: input.startIndex, to: position)
            switch nextCharacter {
            case "0"..."9":
                // Start of a number - need to grab the rest
                let value = getNumber()
                if let last = lastToken {
                    switch last {
                    case .number(_):
                        throw Lexer.Error.invalidToken(nextCharacter, p)
                    default:
                        tokens.append(.number(value))
                    }
                } else {
                    tokens.append(.number(value))
                }
            case "+":
                tokens.append(.plus)
                advance()
            case "-":
                tokens.append(.minus)
                advance()
            case "*":
                tokens.append(.multiply)
                advance()
            case "/":
                tokens.append(.divide)
                advance()
            case " ":
                // Just advance to ignore spaces
                advance()
            default:
                // Something unexpected - need to send back an error
                throw Lexer.Error.invalidCharacter(nextCharacter, p)
            }
        }
        return tokens
    }
    func getNumber() -> Int {
        var value = 0
        while let nextCharacter = peek() {
            switch nextCharacter {
            case "0"..."9":
                // Another digit - add it into the value
                let digitValue = Int(String(nextCharacter))!
                value = 10*value + digitValue
                advance()
            default:
                // A nondigit - go back to regular lexing
                return value
            }
        }
        return value
    }
}

class Parser {
    enum Error: Swift.Error {
        case unexpectedEndOfInput
        case invalidToken(Token, Int)
    }

    let tokens: [Token]
    var position = 0

    init(tokens: [Token]) {
        self.tokens = tokens
    }

    func getNextToken() -> Token? {
        guard position < tokens.count else { return nil }
        let token = tokens[position]
        position += 1
        return token
    }
    func getNumber() throws -> Int {
        guard let token = getNextToken() else {
            throw Parser.Error.unexpectedEndOfInput
        }
        switch token {
        case .number(let value):
            if let next = getNextToken() {
                switch next {
                case .multiply:
                    let nextNum = try getNumber()
                    return value * nextNum
                case .divide:
                    let nextNum = try getNumber()
                    return value / nextNum
                default:
                    position -= 1
                    return value
                }
            } else {
                return value
            }
        case .plus, .minus, .multiply, .divide:
            throw Parser.Error.invalidToken(token, position)
        }
    }
    func parse() throws -> Int {
        // Require a number first
        var value = try getNumber()
        while let token = getNextToken() {
            switch token {
            case .plus:
                // Getting a plus after a number is legal
                // After a plus, we must get another number
                let nextNumber = try getNumber()
                value += nextNumber
            case .minus:
                let nextNumber = try getNumber()
                value -= nextNumber
            case .number:
                // Getting a number after a number is not legal
                throw Parser.Error.invalidToken(token, position)
            default:
                continue
            }
        }
        return value
    }
}

func evaluate(_ input: String) {
    print("Evaluating: \(input)")
    let lexer = Lexer(input: input)
    do {
        let tokens = try lexer.lex()
        print("Lexer output: \(tokens)")
        let parser = Parser(tokens: tokens)
        let result = try parser.parse()
        print("Parser output: \(result)")
    } catch Lexer.Error.invalidCharacter(let c, let p) {
        print("Input contained an invalid character at index \(p): \(c)")
    } catch Parser.Error.unexpectedEndOfInput {
        print("Unexpected end of input during parsing")
    } catch Parser.Error.invalidToken(let token, let p) {
        print("Invalid token during parsing at index \(p): \(token)")
    } catch Lexer.Error.invalidToken(let token, let p) {
        print("Invalid token during parsing at index \(p): \(token)")
    } catch {
        print("An error occured: \(error)")
    }
}

evaluate("10 * 3 + 5 * 3")
evaluate("10 + 3 * 5 + 3")
evaluate("10 + 3 * 5 * 3")
