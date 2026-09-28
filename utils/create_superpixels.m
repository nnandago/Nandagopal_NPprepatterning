function [spx_map, spx_std] = create_superpixels(map, map_std, binsize)
    s = size(map);
    bs = binsize;
    spx_map = nanmean(reshape(map, bs, []));
    spx_map = reshape(spx_map, s(1) / bs,[])';
    spx_map = nanmean(reshape(spx_map,bs,[]));
    spx_map = reshape(spx_map, s(2) / bs,[])';

    spx_std = [];
    if ~isempty(map_std)
        map_std = map_std.^2;
        spx_std = sum(reshape(map_std, bs, []));
        spx_std = reshape(spx_std, s(1) / bs,[])';
        spx_std = sum(reshape(spx_std,bs,[]));
        spx_std = reshape(spx_std, s(2) / bs,[])';
        spx_std = sqrt(spx_std);
    end
end
