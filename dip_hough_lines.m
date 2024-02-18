%Iris Eting 209027333
%Nadav Orenstein 312349509

function HoughMat = dip_hough_lines(BW, R0, teta0)
    [M, N] = size(BW); % Get the size of the input image

    % Quantize parameter space
    R = fix(-sqrt(M^2 + N^2):R0:sqrt(M^2 + N^2)); % R range
    theta = fix(-90:teta0:90); % θ range in degrees

    HoughMat = zeros(length(R), length(theta)); % Create Accumulator Array initialized to 0

    % Loop over each pixel in the image
    for x = 1:M
        for y = 1:N
            if BW(x, y) == 1 % Check if the pixel is an edge pixel
                % Loop over all possible θ values
                for t = 1:length(theta)
                    % Calculate the corresponding r for the current (x, y) and θ
                    r = fix(x * cosd(theta(t)) + y * sind(theta(t)));

                    % Find the index in R corresponding to the calculated r
                    rho_index = find(r == R);

                    % Increment the accumulator array for the current (r, θ) pair
                    HoughMat(rho_index, t) = HoughMat(rho_index, t) + 1;
                end
            end
        end
    end
end







