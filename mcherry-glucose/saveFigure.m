function saveFigure(fh,filename)
    set(fh, 'Color', 'w');
    export_fig([ filename '.png'],'-transparent',fh); 
    saveas(fh,[ filename '.fig']);