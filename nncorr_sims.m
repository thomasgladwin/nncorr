function [RP, RPlabels] = nncorr_sims

nIts = 2000;
RP = [];

for iIt = 1:nIts
    fprintf(['Sim iter ' num2str(iIt) '\n']);
    RProw = [];
    RPlabels = {};
    
    N = 200;
    
    for a = [0 0.1 0.2 0.3 0.4 0.5]
        x = randn(N, 1);
        y = a * x + (1 - a) * randn(N, 1);
        [r, p] = teg_nncorr(x, y);
        RProw = [RProw, r, p];
        RPlabels{end + 1} = ['teg_nncorr Linear' num2str(a)];
        fprintf(['a = ' num2str(a) '. ' 'r = ' num2str(r) ', p = ' num2str(p) '\n']);
        [r, p] = corr(x, y);
        RProw = [RProw, r, p];
        RPlabels{end + 1} = ['Standard Linear' num2str(a)];
        fprintf(['\tNormal corr. ' 'r = ' num2str(r) ', p = ' num2str(p) '\n']);
    end
    
    a = 0.5;
    x = randn(N, 1);
    y = a * x.^2 + (1 - a) * randn(N, 1);
    [r, p] = teg_nncorr(x, y);
    RProw = [RProw, r, p];
    RPlabels{end + 1} = ['teg_nncorr Quadratic' num2str(a)];
    fprintf(['0.5 quadratic. ' 'r = ' num2str(r) ', p = ' num2str(p) '\n']);
    [r, p] = corr(x, y);
    RProw = [RProw, r, p];
    RPlabels{end + 1} = ['Standard Quadratic' num2str(a)];
    fprintf(['\tNormal corr. ' 'r = ' num2str(r) ', p = ' num2str(p) '\n']);
    
    a = 0.5;
    x = linspace(0, 2*pi, N)';
    y = a * cos(x) + (1 - a) * randn(N, 1);
    [r, p] = teg_nncorr(x, y);
    RProw = [RProw, r, p];
    RPlabels{end + 1} = ['teg_nncorr cos' num2str(a)];
    fprintf(['0.5 cos. ' 'r = ' num2str(r) ', p = ' num2str(p) '\n']);
    [r, p] = corr(x, y);
    RProw = [RProw, r, p];
    RPlabels{end + 1} = ['Standard cos' num2str(a)];
    fprintf(['\tNormal corr. ' 'r = ' num2str(r) ', p = ' num2str(p) '\n']);
    
    a = 0.5;
    x = linspace(0, 2*pi, N)';
    y = a * cos(2 * x) + (1 - a) * randn(N, 1);
    [r, p] = teg_nncorr(x, y);
    RProw = [RProw, r, p];
    RPlabels{end + 1} = ['teg_nncorr cos(2x)' num2str(a)];
    fprintf(['0.5 cos 2x. ' 'r = ' num2str(r) ', p = ' num2str(p) '\n']);
    [r, p] = corr(x, y);
    RProw = [RProw, r, p];
    RPlabels{end + 1} = ['Standard cos(2x)' num2str(a)];
    fprintf(['\tNormal corr. ' 'r = ' num2str(r) ', p = ' num2str(p) '\n']);
    
    a = 0.85;
    x = randn(N, 1);
    y = (1 - a) * randn(size(x));
    y(1:2:end) = y(1:2:end) + a * x(1:2:end);
    y(2:2:end) = y(2:2:end) - a * x(2:2:end);
    % figure; scatter(x, y);
    [r, p] = teg_nncorr(x, y);
    RProw = [RProw, r, p];
    RPlabels{end + 1} = ['teg_nncorr cross' num2str(a)];
    fprintf(['0.5 cross. ' 'r = ' num2str(r) ', p = ' num2str(p) '\n']);
    [r, p] = corr(x, y);
    RProw = [RProw, r, p];
    RPlabels{end + 1} = ['Standard cos(2x)' num2str(a)];
    fprintf(['\tNormal corr. ' 'r = ' num2str(r) ', p = ' num2str(p) '\n']);

    RP = [RP; RProw];
end

m = mean(RP(:, 2:2:end) <= 0.05);
for im = 1:length(m)
    fprintf([RPlabels{im} '\t' num2str(m(im)) '\n']);
end
