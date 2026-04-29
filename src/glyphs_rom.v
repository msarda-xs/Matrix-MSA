module name_display(
    input  wire [3:0] char_pos, // Position in the name (0 to 10)
    input  wire [3:0] y,        // Row within the glyph (0-11)
    input  wire [2:0] x,        // Column within the glyph (0-7)
    output wire pixel
);
    reg [5:0] char_code;

    // Logic to select the character for "MARGIE ARDA"
    always @(*) begin
        case (char_pos)
            4'd0:  char_code = 6'd12; // M
            4'd1:  char_code = 6'd0;  // A
            4'd2:  char_code = 6'd17; // R
            4'd3:  char_code = 6'd6;  // G
            4'd4:  char_code = 6'd8;  // I
            4'd5:  char_code = 6'd4;  // E
            4'd6:  char_code = 6'd26; // SPACE
            4'd7:  char_code = 6'd0;  // A
            4'd8:  char_code = 6'd17; // R
            4'd9:  char_code = 6'd3;  // D
            4'd10: char_code = 6'd0;  // A
            default: char_code = 6'd26; // Default to space
        endcase
    end

    // Use the original glyphs_rom to get the pixel
    glyphs_rom font_unit (
        .c(char_code),
        .y(y),
        .x(x),
        .pixel(pixel)
    );

endmodule
