# nncorr
Nearest-neighbour correlation for non-linear relationships

This is a version of a non-linear correlation between variables X and Y that tests the correlation between the Y-scores of pairs of points that are neigbours on the X-axes. This can, e.g., detect U-curves or sinusoidal patterns in scatterplots. The trade-off is that it's less powerful at detecting linear relationships than a standard Peason's correlation.

In Matlab-code:

function [r, p] = nncorr(x, y)

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
