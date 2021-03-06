function latexPNG(imagename,folder,ax)

%addpath('../export_fig')

xlim=get(ax,'Xlim');
ylim=get(ax,'Ylim');

text = fileread('original-plot.tex');

newtext = strrep(text,'xlim1',num2str(xlim(1)));    
newtext = strrep(newtext,'xlim2',num2str(xlim(2)));    
newtext = strrep(newtext,'ylim1',num2str(ylim(1)));    
newtext = strrep(newtext,'ylim2',num2str(ylim(2))); 

newtext = strrep(newtext,'XLabel',ax.XLabel.String);    
newtext = strrep(newtext,'YLabel',ax.YLabel.String);

newtext = strrep(newtext,'imagefile',imagename);   

% Generate grid, if there
if strcmp(get(gca,'XGrid'),'on')
    newtext = strrep(newtext,'gridData','grid=major,');
else
    newtext = strrep(newtext,'gridData','% Grid is switched off.');
end

% Remove box if necessary
if strcmp(get(gca,'box'),'off')
    newtext = strrep(newtext,'boxData','axis x line*=bottom, axis y line*=left,');
else
    newtext = strrep(newtext,'boxData','% Box is switched on.');
end

set(ax,'XTick',[]) % Remove the ticks in the x axis
set(ax,'YTick',[]) % Remove the ticks in the y axis
%%axes('Units', 'normalized', 'Position', [0 0 1 1])
set(ax,'Units','normalized','Position',[0 0 1 1]) % Make the axes occupy the whole figure

%rat = (ylim(1)-ylim(2))./(xlim(1)-xlim(2));
%fig = gcf;
%fig.Position(4) = rat*fig.Position(3);
%newtext = strrep(newtext,'\fheight',[num2str(rat),'\fwidth']); 

axis off
box off

%%set(ax,'color','none')
%%set(ax,'LooseInset',get(ax,'TightInset'));
%hAxes.XRuler.Axle.LineStyle = 'none';  
%%fig.RendererMode = 'manual';
%fig.Renderer= 'openGL';
%fig.Renderer='painters';
%saveas(gca,strcat(folder,imagename,'.eps'),'epsc');
%print(strcat(folder,imagename,'.png'),'-dpng','-r100');
print([folder,imagename],'-r250','-opengl','-dpng'); 

newtext = strrep(newtext,'eps','png');
%figure('PaperPositionMode', 'auto')
%epsclean(strcat(folder,imagename,'.eps'),strcat(folder,imagename,'clear','.eps'),'closeGaps',true,'groupSoft',true);
%export_fig(strcat(folder,imagename,'.eps'),'-depsc','-nocrop','-transparent','-painters');
%saveas(gca,strcat(folder,imagename,'.eps'),'epsc');
%print(strcat(folder,imagename,'.eps'),'-depsc'); 
%Using print currently since there was a problems with 
%export_fig when I tried to use it on 24/09/18. It was generating very
%large files of around 22MB
%cleanfigure;
%export_fig(strcat(folder,imagename,'.eps'),'-r200','-depsc','-nocrop');

%epsclean(strcat(folder,imagename,'.eps'),'closeGaps',true)

fileID = fopen(strcat(folder,imagename,'.tex'),'w');
fprintf(fileID,'%s',newtext);
fclose(fileID);

end