function renderSpheres(objects)
    for n=1:length(objects)
        object=objects{n};
        [x_s, y_s, z_s]=sphere(object.nPoints);
        x_s=x_s*2*object.radius+object.center(1);
        y_s=y_s*2*object.radius+object.center(2);
        z_s=z_s*2*object.radius+object.center(3);
        scale=1e3;
        hSurface=surf(x_s*scale, y_s*scale, z_s*scale,'LineStyle','none');
        set(hSurface,'FaceColor',object.color,'FaceAlpha',0.5,'FaceLighting','gouraud');
        hold on;
    end
    axis('equal');