%Iris Eting 209027333
%Nadav Orenstein 312349509

function HoughMat = dip_hough_circles(BW, R0, teta0)
    [M, N] = size(BW); % Get the size of the input image
    Rmax = min(M,N); %determine Rmax

    % Define the ranges for the parameters a (x-center), b (y-center), and r (radius)
    A = 1:M; % Range of x-center
    B = 1:N; % Range of y-center

    
    R = fix(R0:R0:Rmax); % Range of radius
    theta = fix(-90:teta0:90); % θ range in degrees
    cos_vals = cosd(theta);
    sin_vals = sind(theta);

    % Create Accumulator Array initialized to 0
    HoughMat = zeros(length(A), length(B), length(R));

    % Loop over each edge pixel in the image
    for x = 1:M
        for y = 1:N
            
            if BW(x, y) == 1 % Check if the pixel is an edge pixel
                % Loop over all possible radius values
                for rIndex = 1:length(R)
                    r = R(rIndex);
                    % Loop over a range of angles to cover the entire circle
                    for t = 1:length(theta)
                        % Calculate potential center (a, b) for this radius and angle
                        a = fix(x - r * cos_vals(t));
                        b = fix(y - r * sin_vals(t));
                        
                        % Check if the calculated center is within bounds
                        if a >= 1 && a <= M && b >= 1 && b <= N
                            % Find the indices in A and B corresponding to the calculated (a, b)
                            a_index = 1 + floor((a-1));
                            b_index = 1 + floor((b-1));
                            
                            % Increment the accumulator for the current (a, b, r) triplet
                            HoughMat(a_index, b_index, rIndex) = HoughMat(a_index, b_index, rIndex) + 1;
                            
                        end
                    end
                end
            end
        end
    end