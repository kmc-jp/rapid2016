module SDL2::Q
    module_function
    # 塗りつぶされた円を描画する
    #
    # @param x [Integer] 中心のX座標
    # @param y [Integer] 中心のY座標
    # @param radius [Integer] 半径
    # @param color [[Integer, Integer, Integer]] 色
    # @return [void]
    def fill_circle(x, y, radius, color)
        @@renderer.draw_color = color
        left, right = x-radius, x+radius
        for draw_x in left..right
            dy = Math.sqrt(radius*radius - (draw_x-x)*(draw_x-x))
            @@renderer.draw_line(draw_x, y-dy, draw_x, y+dy)
        end
    end

    #
    # w, h = text_size text, font_size, font_file
    #
    # テキストの描画に必要な領域を取得する
    #
    # @param text [String] 計測するテキスト
    # @param font_size [String] 文字の大きさ
    # @return [Integer, Integer] 横幅, 縦幅
    @@fonts = {}
    def text_size(text, font_size, font_file = "sdl2quick/VL-Gothic-Regular.ttf")
        if @@fonts[font_file].nil?
            @@fonts[font_file] = []
        end
        if @@fonts[font_file][font_size].nil?
            @@fonts[font_file][font_size] = SDL2::TTF.open font_file, font_size
        end
        @@fonts[font_file][font_size].size_text text
    end
end
