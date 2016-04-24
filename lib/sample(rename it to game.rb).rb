$window_width = 640
$window_height = 480
window_size $window_width, $window_height

require "./lib.rb"

mainloop do
    # draw filled circle with border
    fill_circle 50, 150, 101, RED
    fill_circle 50, 150, 100, WHITE

    # centering text
    txt = "hoge"
    set_fontsize 30
    w, h = text_size txt, 30
    draw_x = ($window_width-w)/2
    draw_y = ($window_height-h)/2
    draw_rect draw_x, draw_y, w, h, RED
    text txt, x: draw_x, y: draw_y, color: WHITE
end
