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
    func test_parsing_a_three_value_syntax() {
        XCTAssertEqual(HEXColor(r: 0xD, g: 0xE, b: 0xF, a: 0xFF), "#DEF")
    }

    // Scenario: Parsing a four-value syntax.
    //  Given: I have a hex color as a four-value syntax
    //  When: I parse it
    //  Then: I get an object
    func test_parsing_a_four_value_syntax() {
        XCTAssertEqual(HEXColor(r: 0xA, g: 0xB, b: 0xC, a: 0xD), "#ABCD")
    }

    // Scenario: Parsing a six-value syntax.
    //  Given: I have a hex color as a six-value syntax
    //  When: I parse it
    //  Then: I get an object
    func test_parsing_a_six_value_syntax() {
        XCTAssertEqual(HEXColor(r: 0x1A, g: 0x2B, b: 0x3C, a: 0xFF), "#1A2B3C")
    }

    // Scenario: Parsing an eight-value syntax.
    //  Given: I have a hex color as an eight-value syntax
    //  When: I parse it
    //  Then: I get an object
    func test_parsing_an_eight_value_syntax() {
        XCTAssertEqual(HEXColor(r: 0x1A, g: 0x2B, b: 0x3C, a: 0x4D), "#1A2B3C4D")
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
