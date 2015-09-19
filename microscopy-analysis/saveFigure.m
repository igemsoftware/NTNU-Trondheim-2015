function saveFigure(fh,filename)
    set(fh, 'Color', 'w');
    pdf_dir='pdf/';
    fig_dir='fig/';
    export_fig([pdf_dir filename '.pdf'],'-opengl',fh); 
    saveas(fh,[fig_dir filename '.fig']);