dir = getDirectory("Choose a Directory to PROCESS");
list = getFileList(dir);
dir2 = getDirectory("Choose a Directory for SAVING");
//setBatchMode(true);
for (f=0; f<list.length; f++) {
	path = dir+list[f];
	if (!endsWith(path,"/")) open(path);
	if (nImages>=1) {
		if (endsWith(path,"f")) {
			imgName = getTitle; 
			dir = getDirectory("image"); 
			run("Stack to Images");
			baseNameEnd=indexOf(imgName, ".tif"); 
			baseName=substring(imgName, 0, baseNameEnd); 
			selectWindow(baseName + "-0002");
			run("Grays");
			run("Enhance Contrast...", "saturated=0.3 normalize");
			run("Threshold...");
			setAutoThreshold("Default");
			setOption("BlackBackground", false);
			run("Convert to Mask", "method=Default background=Light calculate");
			run("Dilate", "slice");
			run("Dilate", "slice");
			run("Fill Holes", "slice");
			run("Set Measurements...", "area mean integrated limit redirect=" + baseName + "-0001" + " decimal=3");
			run("Analyze Particles...", "size=2E-8-Infinity circularity=0.10-0.7 show=Outlines display clear add");
			saveAs("Measurements", dir2+baseName+".xls"); 
			print(dir2+baseName+".xls"); 
		      while (nImages>0) { 
		          selectImage(nImages); 
		          close(); 
		      } 
		}
	}
}
