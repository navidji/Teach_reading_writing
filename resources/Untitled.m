

Screen('Preference' , 'SkipSyncTests' , 1)
[win,screenrect]= Screen('OpenWindow',0,[256,256,256],[0 0 1800 1000]);
Screen('TextSize', win, [40]);
%defining arrays 
% alphT1={'A','B','C','D','E','F','G','H'};
% alphS1=['A.wav','B.wav','C.wav','D.wav','E.wav','F.wav','G.wav','H.wav'];
% alphT2={'I','J','K','L','M','N','O','P','Q'};
% alphS2=['I.wav','J.wav','K.wav','L.wav','M.wav','N.wav','O.wav','P.wav','Q.wav'];
% alphT3={'R','S','T','U','V','W','X','Y','Z'};
% alphS3=['R.wav','S.wav','T.wav','U.wav','V.wav','W.wav','X.wav','Y.wav','Z.wav'];
menuLables={'A-H','I-Q','R-Z','Food','Objects','Animals'};
rectB=[0 0 50 50];
textExit=['X'];
textAlp=['Alphabets:']
textW=['Words:']




% % % % % % % % variables for alphabet practice function
KbName('UnifyKeyNames')
Screen('Preference' , 'SkipSyncTests' , 1)
[win,screenrect]= Screen('OpenWindow',0,[20,20,20],[0 0 1800 1000]);
Screen('TextSize', win, [30]);

alphT1={'A','B','C','D','E','F','G','H'};
alphTlow=["a","b","c","d","e","f","g","h"];

%%%%%%%%%%%%%%%%%% Creating the Main Menu
rectcount=0;
rectsize = 500;
gridColSize = 3;
girdRowSize = 2;
displayColSize = gridColSize*rectsize;
displayRowSize = girdRowSize*rectsize;

for y=1:rectsize:displayRowSize 
    for x=1:rectsize:displayColSize
        rectcount = rectcount+1;
        tab(rectcount,:)=[x y x+rectsize-200 y+rectsize/4];
    end
end
tab(:,[1 3])=tab(:,[1 3])+ rectsize/2 +100;
tab(:,[2 4])=tab(:,[2 4])+ rectsize/4;



while true
    %%%%%%%%%%%%%%%% display Menu
    for i=1:6
    Screen('FillRect',win,[97 143 224],tab(i,:))  
    DrawFormattedText(win, menuLables{i},'center','center',[0 0 0],[],[],[],[],[],tab(i,:))
    end
 
     
    %%%%%%%%%%%%%%%%% exit button
    Screen('FillRect',win,[256 0 0],rectB)
    DrawFormattedText(win,textExit,'center','center',[0 0 0],[],[],[],[],[],rectB);
    DrawFormattedText(win,textAlp,[20],[200],[0 0 0])
    DrawFormattedText(win,textW,[20],[700],[0 0 0])
    Screen(win,'flip');
    [mousex,mousey,buttons]=GetMouse(win);
   
    if buttons(1)==1;
       if mousex>rectB(1)& mousex<rectB(3) & mousey>rectB(2) &  mousey<rectB(4);
        break
       elseif mousex>tab(1,1)& mousex<tab(1,3)& mousey>tab(1,2) & mousey<tab(1,4);
              DrawFormattedText(win, alphT1{1},'center','center');  
           Screen(win,'flip',[],1);   
           break
       end
    end
     
end
    
     



