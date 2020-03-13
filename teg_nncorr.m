function [r, p] = teg_nncorr(x, y)

[x, si] = sort(x);
y = y(si);
y1_y2 = [];
for index1 = 1:2:(length(x) - 1)
    index2 = index1 + 1;
    y1 = y(index1);
    y2 = y(index2);
    y1_y2 = [y1_y2; y1 y2];
end
[r, p] = corr(y1_y2(:, 1), y1_y2(:, 2));
