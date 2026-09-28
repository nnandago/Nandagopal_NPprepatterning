function f = plot_quiver_with_clickresponse(tracks_data_forUI)

    f = figure(); hold on;
    set(f, 'Visible', 'on')
    f.WindowButtonDownFcn = @get_position;
    guidata(f, tracks_data_forUI);
    
    % initialize figure
    map_data = tracks_data_forUI.map_data;
    mean_disp = tracks_data_forUI.mean_disp;
    plot_tp = tracks_data_forUI.tp;
    tracks_to_plot = tracks_data_forUI.tracks_to_plot;
    plotted_tracks_idx = tracks_data_forUI.plotted_tracks_idx;

    quiver(map_data(tracks_to_plot, plot_tp, 1), map_data(tracks_to_plot , plot_tp, 2), mean_disp(tracks_to_plot , 1), mean_disp(tracks_to_plot , 2), tracks_data_forUI.VECTOR_SCALE);
    plot(map_data(tracks_to_plot, plot_tp, 1), map_data(tracks_to_plot , plot_tp, 2), 'ro', 'MarkerSize', 1);

end
