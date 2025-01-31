# altwolff 2025
using Images

function julia(width::Int, height::Int, max_iterations::Int, c::Complex)
    min_x = -2.0
    min_y = -1.5
    max_x = 2.0
    max_y = 1.5

    img = zeros(Int, height, width)

    for y in 1:height
        for x in 1:width
            real = min_x + (x / width * (max_x - min_x))
            imag = min_y + (y / height * (max_y - min_y))
            z = real + imag * im
            iter = 0

            while abs(z) <= 2.0 && iter < max_iterations
                z = z * z + c
                iter += 1
            end

            img[y, x] = iter
        end
    end

    return img
end

width, height, max_iterations = 2000, 2000, 1000 # Edit parameters
c = -0.7 + 0.27015im #  Edit complex constant

img = julia(width, height, max_iterations, c)
norm_img = Float64.(img) / max_iterations
save("julia.png", norm_img)