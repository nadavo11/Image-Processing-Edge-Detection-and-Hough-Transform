%Iris Eting 209027333
%Nadav Orenstein 312349509

function edge_image = dip_prewitt_edge(img, thresh)
    % Prewitt filter kernels for horizontal and vertical edges
    prewitt_kernel_x = (1/6)*[-1, 0, 1; -1, 0, 1; -1, 0, 1];
    prewitt_kernel_y = (1/6)*[-1, -1, -1; 0, 0, 0; 1, 1, 1];

    % Convolve the image with the Prewitt kernels
    gradient_x = conv2(img, prewitt_kernel_x, 'same');
    gradient_y = conv2(img, prewitt_kernel_y, 'same');

    % Compute the gradient magnitude
    gradient_magnitude = sqrt(gradient_x.^2 + gradient_y.^2);

    % Apply threshold to the gradient magnitude
    edge_image = gradient_magnitude > thresh;
end

