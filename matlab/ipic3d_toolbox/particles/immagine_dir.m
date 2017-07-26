function [J]=immagine_dir(x,y,J1,name,lmt, Nsm, Ncycle, Ygsm, nfig, labelx,labely, labelc)
global color_choice symmetric_color labelT

load cm_new
load cm_multi4

J=smooth(J1,Nsm);

h=figure(nfig)
%set(h,'Position',[167 51 500*max(x)/max(y)*1.2 500])
Ncut=max(Nsm*3,1)

if(lmt(1) == lmt(2))
lmt(1)=min(J(:));
lmt(2)=max(J(:));
if(symmetric_color==1)
lmt(1)=-max(abs(lmt))
lmt(2)=-lmt(1)
elseif (symmetric_color==-1)
lmt(1)=-min(abs(lmt))
lmt(2)=-lmt(1)
elseif (symmetric_color==2)
lmt(2)=(sqrt(mean(J(:).^2))+max(abs(J(:))))/2;
lmt(1)=-lmt(2)
elseif (symmetric_color==-2)
lmt(2)=(mean(abs(J(:))) + max(abs(J(:))))/2;
lmt(1)=0.0
end
end

imagesc(x,y,J(Ncut:end-Ncut,Ncut:end-Ncut)',lmt)
%[nx,ny]=size(J(Ncut:end-Ncut,Ncut:end-Ncut)')
%v=linspace(min(lmt),max(lmt),20)
%contourf(linspace(min(y),max(y),ny),linspace(min(x),max(x),nx),J(Ncut:end-Ncut,Ncut:end-Ncut)',v)

        if(color_choice==0)
        colormap jet
        elseif (color_choice==1)
        colormap(cm_kbwrk)
        elseif (color_choice==2)
        colormap(cool)
        elseif (color_choice==3)
        colormap(cm_cool_hot_2)
        elseif (color_choice==4)
           colormap('default')
        end
        
        
        c = colorbar
        ylabel(c,labelc)
        set(gca,'fontsize',[14])
set(gca,'fontsize',[14])
xlabel(labelx,'fontsize',[14])
ylabel(labely,'fontsize',[14])

title([labelT Ncycle '  Npart=' num2str(Ygsm)], 'fontsize',[14])

        
%axis image
axis xy
%set(gca,'xdir','reverse','TickDir','out')
%set(gca,'TickDir','out')
%print('-depsc','-r300',[name '.eps'])
print('-dpng','-r300',[name '.png'])
%saveas(gcf,[name '.fig'])