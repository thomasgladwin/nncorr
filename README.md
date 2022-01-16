# nncorr
Nonlinear neighbourhood correlation.

Product of some idle musings about non-linear, very general measures of association, not sure whether it's any use for anything: This is a version of a very simple non-linear correlation between variables X and Y that tests the correlation between the Y-scores of pairs of points that are neighbours on the X-axes. This can, e.g., detect U-curves or sinusoidal patterns in scatterplots. The trade-off is that it's less powerful at detecting linear relationships than a standard Peason's correlation.

In Matlab-code:

```
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
```

Please cite as: Thomas Edward Gladwin. (2020, March 13). thomasgladwin/nncorr: Initial release (Version v1). Zenodo. http://doi.org/10.5281/zenodo.3710404

[![DOI](https://zenodo.org/badge/247157218.svg)](https://zenodo.org/badge/latestdoi/247157218)
