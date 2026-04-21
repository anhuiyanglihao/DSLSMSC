function X = soft_thresholding(Y, tau)
    % ÈíãÐÖµ²Ù×÷·û
    X = sign(Y) .* max(abs(Y) - tau, 0);
end