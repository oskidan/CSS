import XCTest

@testable import CSS

final class HexadecimalColor: XCTestCase {

    // Hexadecimal color consists of primary color components (red, green, blue) written as hexadecimal numbers,
    // as well as its transparency.
    // Syntax:
    //  - #RGB      The three-value syntax
    //  - #RGBA     The four-value syntax
    //  - #RRGGBB   The six-value syntax
    //  - #RRGGBBAA The eight-value syntax

    // Scenario: Parsing a three-value syntax.
    //  Given: I have a hex color as a three-value syntax
    //  When: I parse it
    //  Then: I get an object
    func test_parsing_a_three_value_syntax() throws {
        let color = try HEXColor(parsing: "#DEF")
        XCTAssertEqual(color.r, 0xD)
        XCTAssertEqual(color.g, 0xE)
        XCTAssertEqual(color.b, 0xF)
        XCTAssertEqual(color.a, 0xFF)
    }

    // Scenario: Parsing a four-value syntax.
    //  Given: I have a hex color as a four-value syntax
    //  When: I parse it
    //  Then: I get an object
    func test_parsing_a_four_value_syntax() throws {
        let color = try HEXColor(parsing: "#ABCD")
        XCTAssertEqual(color.r, 0xA)
        XCTAssertEqual(color.g, 0xB)
        XCTAssertEqual(color.b, 0xC)
        XCTAssertEqual(color.a, 0xD)
    }

    // Scenario: Parsing a six-value syntax.
    //  Given: I have a hex color as a six-value syntax
    //  When: I parse it
    //  Then: I get an object
    func test_parsing_a_six_value_syntax() throws {
        let color = try HEXColor(parsing: "#1A2B3C")
        XCTAssertEqual(color.r, 0x1A)
        XCTAssertEqual(color.g, 0x2B)
        XCTAssertEqual(color.b, 0x3C)
        XCTAssertEqual(color.a, 0xFF)
    }

    // Scenario: Parsing an eight-value syntax.
    //  Given: I have a hex color as an eight-value syntax
    //  When: I parse it
    //  Then: I get an object
    func test_parsing_an_eight_value_syntax() throws {
        let color = try HEXColor(parsing: "#1A2B3C4D")
        XCTAssertEqual(color.r, 0x1A)
        XCTAssertEqual(color.g, 0x2B)
        XCTAssertEqual(color.b, 0x3C)
        XCTAssertEqual(color.a, 0x4D)
    }

    // Scenario: Converting to a three-value syntax
    //  Given: I have a hex color 
    //  And: It can be represented as a three-value syntax 
    //  When: I get its description
    //  Then: It is a three-value syntax
    func test_converting_to_a_three_value_syntax() {
        XCTAssertEqual(HEXColor(r: 0xA, g: 0xB, b: 0xC, a: 0xFF).description, "#ABC")
    }

    // Scenario: Converting to a four-value syntax
    //  Given: I have a hex color 
    //  And: It can be represented as a four-value syntax 
    //  When: I get its description
    //  Then: It is a three-value syntax
    func test_converting_to_a_four_value_syntax() {
        XCTAssertEqual(HEXColor(r: 0xA, g: 0xB, b: 0xC, a: 0xD).description, "#ABCD")
    }

    // Scenario: Converting to a six-value syntax
    //  Given: I have a hex color 
    //  And: It can be represented as a six-value syntax 
    //  When: I get its description
    //  Then: It is a three-value syntax
    func test_converting_to_a_six_value_syntax() {
        XCTAssertEqual(HEXColor(r: 0x1A, g: 0x2B, b: 0x3C, a: 0xFF).description, "#1A2B3C")
        XCTAssertEqual(HEXColor(r: 0xA, g: 0x2B, b: 0x3C, a: 0xFF).description, "#0A2B3C")
        XCTAssertEqual(HEXColor(r: 0xA, g: 0xB, b: 0x3C, a: 0xFF).description, "#0A0B3C")
        XCTAssertEqual(HEXColor(r: 0x1A, g: 0xB, b: 0xC, a: 0xFF).description, "#1A0B0C")
    }

    // Scenario: Converting to an eight-value syntax
    //  Given: I have a hex color 
    //  And: It can be represented as an eight-value syntax 
    //  When: I get its description
    //  Then: It is a three-value syntax
    func test_converting_to_an_eight_value_syntax() {
        XCTAssertEqual(HEXColor(r: 0x1A, g: 0x2B, b: 0x3C, a: 0x4D).description, "#1A2B3C4D")
        XCTAssertEqual(HEXColor(r: 0xA, g: 0x2B, b: 0x3C, a: 0x4D).description, "#0A2B3C4D")
        XCTAssertEqual(HEXColor(r: 0xA, g: 0xB, b: 0x3C, a: 0x4D).description, "#0A0B3C4D")
        XCTAssertEqual(HEXColor(r: 0xA, g: 0xB, b: 0xC, a: 0x4D).description, "#0A0B0C4D")
        XCTAssertEqual(HEXColor(r: 0x1A, g: 0xB, b: 0xC, a: 0xD).description, "#1A0B0C0D")
    }
}
