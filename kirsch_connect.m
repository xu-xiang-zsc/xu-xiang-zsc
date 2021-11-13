% �������������
% �ļ���: kirsch_connect
% �ļ�����: ѡ��ָ�������ݿ�, Ȼ�󽫿��е�ָ����ͼ��ʹ��3sigmaԭ����ȡROI
% ����: 
%   choice: ѡ�����ݿ�
%   ����: �Բ�ͬ���ݿ���в�ͬ��ͼ��Ԥ����, ����ο�resize�Ⱥ������������
% ���:
%   roi: ��ȡ����ROIͼ��
%   mask: ��ȡROIͼ��ʱʹ�õ�Mask
%
%2020-5-6
close all

% clc
% clear

close all
s=['��ѡ�����ݿ⣺\n' ...
    '1:hkpu;\n' ...
    '2:mmcbnu\n'...
    '3:fv_usm\n'...
    '4:zs\n']
choice=input(s)
switch choice
    case 1
       in_path='D:\develop\database\01hkpu\segmented_256_513'%hkpuԭͼ·��       
       out_roi_path='D:\develop\database\01hkpu\kirsch_connect_3layer_roi\'
       out_mask_path='D:\develop\database\01hkpu\kirsch_connect_3layer_mask\'%����ȡ��mask�洢��·��
       out_fig_path='D:\develop\database\01hkpu\kirsch_connect_3layer_fig\'%�������̵�·��
       layer_2_path='D:\develop\database\01hkpu\kirsch_connect_3layer_fig\2layer\'
       layer_3_path='D:\develop\database\01hkpu\kirsch_connect_3layer_fig\3layer\'
       
       imds = imageDatastore(in_path,'IncludeSubfolders',true,'LabelSource','none');
       files = string(imds.Files);
       parts = split(files,filesep);      
       out_mask_files=strcat(out_mask_path,parts(:,6));%
       out_fig_files=strcat(out_fig_path,parts(:,6));%    
       out_roi_files=strcat(out_roi_path,parts(:,6));
       layer_2_files=strcat(layer_2_path,parts(:,6));
       layer_3_files=strcat(layer_3_path,parts(:,6));
       h1=30;
       h2=10;
       w1=30;
       w2=50;  
    case 2
       in_path='G:\my program\databases\02MMCBNU-6000\original_480_640'%hkpuԭͼ·��       
       out_roi_path='G:\my program\databases\02MMCBNU-6000\kirsch_connect_3layer_roi\'
       out_mask_path='G:\my program\databases\02MMCBNU-6000\kirsch_connect_3layer_mask\'%����ȡ��mask�洢��·��
       out_fig_path='G:\my program\databases\02MMCBNU-6000\kirsch_connect_3layer_fig\'%�������̵�·��
       layer_2_path='G:\my program\databases\02MMCBNU-6000\kirsch_connect_3layer_fig\2layer\'
       layer_3_path='G:\my program\databases\02MMCBNU-6000\kirsch_connect_3layer_fig\3layer\'
       
       imds = imageDatastore(in_path,'IncludeSubfolders',true,'LabelSource','none');
       files = string(imds.Files);
       parts = split(files,filesep);      
       out_mask_files=strcat(out_mask_path,parts(:,6));%
       out_fig_files=strcat(out_fig_path,parts(:,6));%    
       out_roi_files=strcat(out_roi_path,parts(:,6));
       layer_2_files=strcat(layer_2_path,parts(:,6));
       layer_3_files=strcat(layer_3_path,parts(:,6));
       h=5;
       w1=5;
        w2=5;
    case 3
       in_path='G:\my program\databases\03fv_usm\original'%fv_usmԭͼ·��       
       out_roi_path='G:\my program\databases\03fv_usm\kirsch_connect_3layer_roi\'
       out_mask_path='G:\my program\databases\03fv_usm\kirsch_connect_3layer_mask\'%����ȡ��mask�洢��·��
       out_fig_path='G:\my program\databases\03fv_usm\kirsch_connect_3layer_fig\'%�������̵�·��
       layer_2_path='G:\my program\databases\03fv_usm\kirsch_connect_3layer_fig\2layer\'
       layer_3_path='G:\my program\databases\03fv_usm\kirsch_connect_3layer_fig\3layer\'
       
       imds = imageDatastore(in_path,'IncludeSubfolders',true,'LabelSource','none');
       files = string(imds.Files);
       parts = split(files,filesep);      
       out_mask_files=strcat(out_mask_path,parts(:,6));%
       out_fig_files=strcat(out_fig_path,parts(:,6));%    
       out_roi_files=strcat(out_roi_path,parts(:,6));
       layer_2_files=strcat(layer_2_path,parts(:,6));
       layer_3_files=strcat(layer_3_path,parts(:,6));
      h=150;
        
    case 4
       in_path='G:\my program\databases\04zs\original'%zsԭͼ·��
       out_roi_path='G:\my program\databases\04zs\kirsch_connect_3layer_roi\'
       out_mask_path='G:\my program\databases\04zs\kirsch_connect_3layer_mask\'%����ȡ��mask�洢��·��
       out_fig_path='G:\my program\databases\04zs\kirsch_connect_3layer_fig\'%�������̵�·��
       imds = imageDatastore(in_path,'IncludeSubfolders',true,'LabelSource','none');
       files = string(imds.Files);
       parts = split(files,filesep);
       name=strcat(parts(:,6),'_',parts(:,7));
       out_mask_files=strcat(out_mask_path,name);%
       out_fig_files=strcat(out_fig_path,name);%    
       layer_2_path='G:\my program\databases\04zs\kirsch_connect_3layer_fig\2layer\'
       layer_3_path='G:\my program\databases\04zs\kirsch_connect_3layer_fig\3layer\'
       out_roi_files=strcat(out_roi_path,name);  
       layer_2_files=strcat(layer_2_path,name);
       layer_3_files=strcat(layer_3_path,name);
       h=20;
       w1=20;
       w2=20;
end

% for i=8333:size(imds.Files)
for i=1:1
    i
     file=imds.Files{i}
     inputImg =imread(file);
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     %(1)obtain roi candidate region. ��ȡROI��ѡ����
     figure,subplot(4,5,1),imshow(inputImg,[]),title('ԭʼͼ��')
     switch choice
        case 1
            inputImg=inputImg(h1:end-h2,w1:end-w2);     
            inputImg=imresize(inputImg,0.5);
            candidate_region=double(inputImg);
            tt=strcat('remove',num2str(h1));
            subplot(4,5,2),imshow(candidate_region,[]),title(tt)
            a=max(max(candidate_region));
            b=min(min(candidate_region));
            candidate_region=(candidate_region-b)/(a-b);
            
            th_area=50;
            dis_thresh=50;
         case 2
            inputImg=inputImg(h:end-h,w1:end-w2);
            inputImg=imresize(inputImg,0.25);
            candidate_region=double(inputImg);
            tt=strcat('remove',num2str(h));
            subplot(4,5,2),imshow(candidate_region,[]),title(tt)
          
            a=max(max(candidate_region));
            b=min(min(candidate_region));
            candidate_region=(candidate_region-b)/(a-b);
           
            th_area=50;    
            dis_thresh=50;
         case 3
           
            candidate_region=double(inputImg);
            tt=strcat('remove',num2str(h));
            subplot(4,5,2),imshow(candidate_region,[]),title(tt)
          
            a=max(max(candidate_region));
            b=min(min(candidate_region));
            candidate_region=(candidate_region-b)/(a-b);
           
            th_area=50;    
            dis_thresh=50;
             
             
        case 4
            
            inputImg=inputImg(h:end-h,w1:end-w2);
            inputImg=imresize(inputImg,0.5);
            candidate_region=double(inputImg);
            tt=strcat('remove',num2str(h));
            subplot(4,5,2),imshow(candidate_region,[]),title(tt)
          
            a=max(max(candidate_region));
            b=min(min(candidate_region));
            candidate_region=(candidate_region-b)/(a-b);
           
            th_area=50;    
            dis_thresh=50;
     end
    % ˫���˲�, ͼ��ƽ��
     patchVar=std2(candidate_region)^2;
     Dos=4*patchVar;
     im_bi=imbilatfilt(candidate_region,Dos);
     subplot(4,5,3),imshow(im_bi,[]),title(['Degree of smoothing:',num2str(Dos)]) 
 
      %��3��������
      tic
      ed_kir=kirschEdge(im_bi);
      kir_time(i)=toc;
      subplot(4,5,4),imshow(ed_kir),title('kirschedge')
      half_img_h=round(size(im_bi,1)/2); %ͼ��߶�����
      half_img_w=round(size(im_bi,2)/2);%ͼ���������
      
      %��4��hough�任��ȡ��Ե
      level = [];
      [level(i),layer_time(i),super_hough,super_hough_fix]=ed_kirsch_connect(half_img_h,half_img_w,ed_kir,im_bi,th_area,dis_thresh ,choice);
      
      
      subplot(4,5,15),imshow(imoverlay(im_bi,super_hough,'red'),'InitialMagnification',67),title('����ǰ')
      subplot(4,5,16),imshow(imoverlay(im_bi,super_hough_fix,'red'),'InitialMagnification',67),title('������')
      
      %��5����ȡroi
     [roi,mask]=super_roi(inputImg,super_hough_fix,half_img_h);
     subplot(4,5,19),imshow(mask,[]),title('mask')
     subplot(4,5,20),imshow(roi,[]),title('roi')
     
     imwrite(uint8(roi),out_roi_files{i})
     imwrite(mask,out_mask_files{i});
     
     
    switch level(i)
        case 1
            saveas(gcf,out_fig_files{i})               
        case 2
            saveas(gcf,layer_2_files{i})
        case 3
            saveas(gcf,layer_3_files{i})
    end
    % ����ʱע�ʹ˾�, ͨ�����ڲ鿴��������м���
    close all
end
% �������м����, ��γ����ǵ���ʱʹ�õ�
% ��ע�͵�
% 2021-11-10
% switch choice
%     case 1
%       save ('level_hk','level','kir_time','layer_time')  
%     case 2
%       save ('level_mmcbnu','level','kir_time','layer_time')   
%     case 3
%       save ('level_fvusm','level','kir_time','layer_time')   
%     case 4
%       save ('level_zs','level','kir_time','layer_time')
% end