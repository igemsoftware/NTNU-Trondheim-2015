		imgName = getTitle; 
		dir = getDirectory("image"); 
		run("Stack to Images");
		baseNameEnd=indexOf(imgName, ".tif"); 
		baseName=substring(imgName, 0, baseNameEnd); 
		selectWindow(baseName + "-0002");
		run("Grays");
		// run("Subtract Background...", "rolling=50 light slice");
		run("Threshold...");
		setAutoThreshold("Default");
		setOption("BlackBackground", false);
		run("Convert to Mask", "method=Default background=Light calculate");
		run("Set Measurements...", "area mean standard modal min centroid center perimeter bounding fit shape feret's integrated median skewness kurtosis area_fraction stack limit redirect=" + baseName + "-0001" + " decimal=3");
		run("Analyze Particles...", "size=2E-8-Infinity circularity=0.10-0.7 show=Outlines display clear add");
//	  	 while (nImages>0) { 
//		     selectImage(nImages); 
//		     close(); 
//		} 