import JavaScriptKit

public struct HEXColor: Sendable {
    let r: Int
    let g: Int
    let b: Int
    let a: Int
}

extension HEXColor: Equatable {}

extension HEXColor {
    public init(parsing description: String) throws {
        var it = description.makeIterator()
        guard it.next() == "#" else {
            throw ParsingError("Cannot parse a hex color. Wrong syntax: must start with '#'.")
        }

        func nextValue() throws -> Int {
            guard let value = it.next()?.hexDigitValue else {
                throw ParsingError("Cannot parse a hex color. Wrong syntax: must consist of hex digits.")
            }
            return  value & 0xF
        }

        switch description.count {
        case 4:
            r = try nextValue()
            g = try nextValue()
            b = try nextValue()
            a = 0xFF
        case 5:
            r = try nextValue()
            g = try nextValue()
            b = try nextValue()
            a = try nextValue()
        case 7:
            r = try (nextValue() << 4) | nextValue()
            g = try (nextValue() << 4) | nextValue()
            b = try (nextValue() << 4) | nextValue()
            a = 0xFF
        case 9:
            r = try (nextValue() << 4) | nextValue()
            g = try (nextValue() << 4) | nextValue()
            b = try (nextValue() << 4) | nextValue()
            a = try (nextValue() << 4) | nextValue()
        default:
            throw ParsingError("Cannot parse a hex color. Bad string length: \(description.count).")
        }
    }
}

extension HEXColor: LosslessStringConvertible {
    public init?(_ description: String) {
        guard let color = try? HEXColor(parsing: description) else {
            return nil
        }
        self = color
    }

    public var description: String {
        let isBig = r > 0xF || g > 0xF || b > 0xF || (a < 0xFF && a > 0xF)
        let R = hex(r, big: isBig)
        let G = hex(g, big: isBig)
        let B = hex(b, big: isBig)
        let A = hex(a, big: isBig)
        if a == 0xFF {
            return "#\(R)\(G)\(B)"
        } else {
            return "#\(R)\(G)\(B)\(A)"
        }
    }

    private func hex(_ value: Int, big: Bool) -> String {
        let hex = String(value, radix: 16, uppercase: true)
        if big && value <= 0xF {
            return "0" + hex
        }
        return hex
    }
}

extension HEXColor: ConvertibleToJSValue {
    public var jsValue: JSValue {
        .string(description)
    }
}

extension HEXColor: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        do {
            self = try HEXColor(parsing: value)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}

extension HEXColor {
    public struct ParsingError: Error {
        let localizedDescription: String

        init(_ description: String) {
            localizedDescription = description
        }
    }
}
