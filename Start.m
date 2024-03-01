function Start


[fileRoot, filePath] = uigetfile({'*.xyz';'*.datx';'*.xlsx'},'File Selector','multiselect','on');

 filename = fullfile(filePath, fileRoot);

 Matrix=Open_File(filename)*1e3;

 max_size=1000;

[RMS,~,PV]=RMS_STD_PV( Matrix);
 Plots(Matrix,['Original, RMS: ',num2str(RMS),' nm, PV: ',num2str(PV), ' nm'],-5,5,2,1,1)

 Output=Filtering_Surface(Matrix,max_size); 
[RMS,~,PV]=RMS_STD_PV(Output);
 Plots(Output,['Filter, RMS: ',num2str(RMS),' nm, PV: ',num2str(PV), ' nm'],-5,5,2,1,2)

end