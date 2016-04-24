$window_width = 640
$window_height = 480
window_size $window_width, $window_height

require "./lib.rb"

$loop = 0

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

    set_color [255, 255, 255].map{ |item| item * Math.sin($loop/10.0) * Math.sin($loop/10.0) }
    0.upto(20) do |y|
        0.upto($window_width) do |x|
            draw_point_without_color x, y
        end
    end
    fill_rect_without_color 200, 200, 50, 50

    $loop += 1
end
