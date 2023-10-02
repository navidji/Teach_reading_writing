% % Prepration
close all;
clear all;
clc;
Screen('Preference' , 'SkipSyncTests' , 1)
[win,screenrect]= Screen('OpenWindow',0,[256,256,256],[0 0 1800 1000]);

%% loding the program
MainMenu(win);

%% %% Here is the function which show the main menue
function MainMenu(win)
Screen('TextSize', win, [40]);

% % % % % % % % %defining constants, arrays & variables
wordList= ["ant","bat","canary","cat","dog","duck","eagle","fox","goat","goose","koala","lion","mole","penguin","pig","rabbit","sheep","skunk","swan","tiger","zebra","axe","belt","brush","cape","dress","hat","jacket","ladder","pencil","shirt","banana","cherry","kiwi","lemon","peach","pumpkin","tomato"];
Animals=["ant","bat","canary","cat","dog","duck","eagle","fox","goat","goose","koala","lion","mole","penguin","pig","rabbit","sheep","skunk","swan","tiger","zebra"]
Objects=["axe","belt","brush","cape","dress","hat","jcaket","ladder","pencil","shirt"]
Fruits=["banana","cherry","kiwi","lemon","peach","pumpkin","tomato"]
menuLables={'A-H','I-Q','R-Z','Fruits','Objects','Animals'};
rectB=[0 0 50 50];
textExit=['X'];
textAlp=['Alphabets:']
textW=['Words:']
rectTest=[600,850,1200,950];
tText=['Test']
KbName('UnifyKeyNames')
alphT1={'A','B','C','D','E','F','G','H'};
alphTlow=["a","b","c","d","e","f","g","h"];
alphT2={'I','J','K','L','M','N','O','P','Q'};
alphT2low=["i","j","k","l","m","n","o","p","q"];
alphT3={'R','S','T','U','V','W','X','Y','Z'};
alphT3low=["r","s","t","u","v","w","x","y","z"];

%%%%%%%%%%%%%%%%%% menu tabs
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
 Screen('FillRect',win,[224 143 97],rectTest)
     
%%%%%%%%%%%%%%%%% exit button
    Screen('FillRect',win,[256 0 0],rectB)
    DrawFormattedText(win,textExit,'center','center',[0 0 0],[],[],[],[],[],rectB);
    DrawFormattedText(win,tText,'center','center',[0 0 0],[],[],[],[],[],rectTest);
    DrawFormattedText(win,textAlp,[60],[200],[0 0 0]);
    DrawFormattedText(win,textW,[60],[700],[0 0 0]);
    Screen(win,'flip');
    [mousex,mousey,buttons]=GetMouse(win);
   
    if buttons(1)==1
       if mousex>rectB(1)&& mousex<rectB(3) && mousey>rectB(2) &&  mousey<rectB(4) 
            break
       elseif mousex>tab(1,1)&& mousex<tab(1,3)&& mousey>tab(1,2) && mousey<tab(1,4)
            alphapractice(alphT1 , alphTlow,win)  
       elseif mousex>tab(2,1)&& mousex<tab(2,3)&& mousey>tab(2,2) && mousey<tab(2,4)
            alphapractice(alphT2 , alphT2low,win) 
       elseif  mousex>tab(3,1)&& mousex<tab(3,3)&& mousey>tab(3,2) && mousey<tab(3,4)
            alphapractice(alphT3 , alphT3low,win) 
       elseif  mousex>tab(4,1)&& mousex<tab(4,3)&& mousey>tab(4,2) && mousey<tab(4,4)
            wordpractice(Fruits,win)
       elseif  mousex>tab(5,1)&& mousex<tab(5,3)&& mousey>tab(5,2) && mousey<tab(5,4)
            wordpractice(Objects,win)
       elseif  mousex>tab(6,1)&& mousex<tab(6,3)&& mousey>tab(6,2) && mousey<tab(6,4)
            wordpractice(Animals,win)
       elseif  mousex>rectTest(1)&& mousex<rectTest(3)&& mousey>rectTest(2) && mousey<rectTest(4)
           wordTest(wordList, win);
       end
    end
     
end
sca

end

%% Here is the function which shows the learing part of the Alphabets
function alphapractice(alphT1,alphTlow,win)

directory1=["resources\letters\"];
LRtext=['Tell the child to listen and repeat with us'];
starttext=['Press SPACE to start']
DrawFormattedText(win, LRtext,'center','center',[97 143 224]);
DrawFormattedText(win, starttext,'center',[900],[97 143 224]);
Screen(win,'flip');
 [keyTime, keyCode]= KbStrokeWait;
    keyname=KbName(keyCode);
    if strcmp('space',keyname)
        for i=1:length(alphT1)
            Screen('TextSize', win, [200]);
            randcolour =randperm(230,3)
            address{i}=strcat(directory1,alphT1(i),".wav")
            DrawFormattedText(win, alphT1{i},'center','center',randcolour);
             Screen(win,'flip');
            playSound(address{i})     
        end
    end
  
 Screen('TextSize', win, [40]);
 ptext=['lets practice now!'];
 intext=['write the letter that you hear'];
 Wrong=['WRONG :('];
 correct=['Correct :)']
 welldone=['well done,you were great!'];
 fail=['good,but you need more practice'];
 accuracyText=['your accuracy in this practice is:'];
 DrawFormattedText(win, ptext,'center',[300],[97 143 224]);
 DrawFormattedText(win, intext,'center','center',[97 143 224]);
 DrawFormattedText(win, starttext,'center',[900],[97 143 224]);
 Screen(win,'flip');
 r1=randperm(8,8);
 cr=0;
 wr=0;
 [keyTime, keyCode]= KbStrokeWait;
 keyname=KbName(keyCode);
          
   if strcmp('space',keyname)
      for i=1:8
          Screen(win,'flip');
          Screen('TextSize', win, [200]);
          randcolour =randperm(230,3);
          randletter=r1(i);
          alphran=alphT1(randletter);
          [data, sampling_rate] = audioread(address{randletter});
          pahandle = PsychPortAudio('Open',[],[], [],sampling_rate,1,[],[]);
          PsychPortAudio('FillBuffer',pahandle,data');
          PsychPortAudio('Start',pahandle);
          [keyTime, keyCode]= KbStrokeWait;
          keyname=KbName(keyCode);
          PsychPortAudio('Close',pahandle);
          DrawFormattedText(win,upper(keyname),'center','center', randcolour);
          Screen(win,'flip');
          pause(0.5)
          
          if strcmp(alphTlow(randletter),keyname)
             DrawFormattedText(win,correct,'center','center',[0,100,0]);
             Screen(win,'flip');
             playSound('resources\added\win.wav')
             cr=cr+1;
              
          else
           DrawFormattedText(win,Wrong,'center','center',[100 0 0]);
           Screen(win,'flip');
           playSound('resources\added\lose.wav')
            wr=wr+1;
          end
   
      end
   end
     accuracy =(cr/(cr+wr))*100
     Screen('TextSize', win, [40]);
     text1=[,num2str(accuracy),' %'];
     DrawFormattedText(win,accuracyText,'center','center',[0,100,0]);
     DrawFormattedText(win,text1,'center',[600],[0,100,0])
     mainmenu=['Main Menu'];
     Exit=['Exit'];
     rectE=[1000 750 1300 850];
     rectM=[500 750 800 850];
     Screen(win,'flip');
     pause(2)
 if accuracy > 50
     DrawFormattedText(win,welldone,'center','center',[0,100,0]);
   playSound('resources\added\achievement.wav')
 else
     DrawFormattedText(win,fail,'center','center',[100,0,0]);
     playSound('resources\added\lose.wav')
 end
 
    Screen(win,'flip',[],1);
 while true
 Screen('FillRect',win,[97 143 224],[500 750 800 850])
 Screen('FillRect',win,[224 90 90],[1000 750 1300 850])
 DrawFormattedText(win,mainmenu,'center','center',[0 0 0],[],[],[],[],[],rectM)
 DrawFormattedText(win,Exit,'center','center',[0 0 0],[],[],[],[],[],rectE)
 [mousex,mousey,buttons]=GetMouse(win);
    if buttons(1)==1;
       if mousex>rectE(1)&& mousex<rectE(3) && mousey>rectE(2) &&  mousey<rectE(4);
           break
       elseif mousex>rectM(1)&& mousex<rectM(3)&& mousey>rectM(2) && mousey<rectM(4); 
           MainMenu(win);        
       end
    end
    Screen(win,'flip',[],1);
 end
  sca    
end


%% Here is the function which shows the learing part of the Words

 function wordpractice(wordList,win) 
Wrong=['WRONG :('];
correct=['Correct :)'];
welldone=['well done,you were great!'];
fail=['good,but you need more practice'];
accuracyText=['your accuracy in this practice is:'];
directory1=["resources\letters\"];
directory2=["resources\images\"];
directory3=["resources\words\"];
cr=0
wr=0
 
LRtext=['Tell the child to listen and repeat with each word'];
inctext=['After that spell the word in the GREEN BOX  and press Return to see the result'];
starttext=['Press SPACE to start'];

DrawFormattedText(win, LRtext,'center',[500],[97 143 224]);
DrawFormattedText(win, inctext,'center',[650],[97 143 224]);
DrawFormattedText(win, starttext,'center',[900],[97 143 224]);
Screen(win,'flip');

[keyTime, keyCode]= KbStrokeWait;
keyname=KbName(keyCode);
if strcmp('space',keyname)
    for i=1:length(wordList)
        Screen('TextSize', win,[70]);
        randcolour=randperm(230,3);
        address2{i}=strcat(directory2,wordList(i),".jpg");
        address3{i}=strcat(directory3,wordList(i),".wav");
        myimage=imread(address2{i});
        Tex=Screen('MakeTexture',win,myimage);
        Screen('DrawTexture',win,Tex,[],[650 100 1150 600]);
        DrawFormattedText(win, upper(wordList{i}),'center',[650],randcolour)
        Screen('Flip',win)
        playSound(address3{i})
        n=0
        keypressed=[]
        Screen('FillRect',win,[0 256 0],[650 400 1150 600])
        Screen('FillRect',win,[256 256 256],[660 410 1140 590])
        Screen(win,'Flip',[],1)
      while true
             Screen('FillRect',win,[0 256 0],[650 400 1150 600])
        Screen('FillRect',win,[256 256 256],[660 410 1140 590])
        [keyTime, keyCode]= KbStrokeWait;
        keyname=KbName(keyCode);
        addressalph=strcat(directory1,keyname,".wav");

        if strcmp('Return',keyname)
            break 
        end 
        keypressed=[keypressed keyname];
        DrawFormattedText(win,upper(keypressed),'center','center',[0 0 0],[],[],[],[],[],[660 410 1140 590])
        Screen('Flip',win)
        playSound(addressalph)

      end
       if  strcmp(keypressed,wordList(i)) 
           playSound(address3{i})
           DrawFormattedText(win,correct,'center','center',[0,100,0]);
           pause(.2)
           Screen(win,'flip');
           playSound('resources\added\win.wav')
           cr=cr+1;
       else
           DrawFormattedText(win,Wrong,'center','center',[100 0 0]);
           Screen(win,'flip');
           playSound('resources\added\lose.wav')
           wr=wr+1;

       end
    end
end
accuracy =(cr/(cr+wr))*100;
     Screen('TextSize', win, [40]);
     text1=[,num2str(accuracy),' %'];
     DrawFormattedText(win,accuracyText,'center','center',[0,100,0]);
     DrawFormattedText(win,text1,'center',[600],[0,100,0])
     mainmenu=['Main Menu'];
     Exit=['Exit'];
     rectE=[1000 750 1300 850];
     rectM=[500 750 800 850];
     Screen(win,'flip');
     pause(2)
 if accuracy > 50
     DrawFormattedText(win,welldone,'center','center',[0,100,0]);
   playSound('resources\added\achievement.wav')
 else
     DrawFormattedText(win,fail,'center','center',[100,0,0]);
     playSound('resources\added\lose.wav')
 end
 while true
 Screen('FillRect',win,[97 143 224],[500 750 800 850])
 Screen('FillRect',win,[224 90 90],[1000 750 1300 850])
 DrawFormattedText(win,mainmenu,'center','center',[0 0 0],[],[],[],[],[],rectM)
 DrawFormattedText(win,Exit,'center','center',[0 0 0],[],[],[],[],[],rectE)
 [mousex,mousey,buttons]=GetMouse(win);
    if buttons(1)==1;
       if mousex>rectE(1)&& mousex<rectE(3) && mousey>rectE(2) &&  mousey<rectE(4);
           break
       elseif mousex>rectM(1)&& mousex<rectM(3)&& mousey>rectM(2) && mousey<rectM(4);
              MainMenu(win);     
       end
    end
    Screen(win,'flip',[],1);
 end
  sca  
end  
    
       
%% Here is the function which shows the general test
function wordTest(wordList, win);

Screen('TextSize', win, [40]);
directory2=["resources\images\"];
welldone=['well done,you were great!'];
fail=['good,but you need more practice'];
Wrong=['WRONG :('];
correct=['Correct :)'];
cr=0;
Wr=0;
b=0;
testedWords=[];
% n=0;
% response={};
% score=[];
randf=randperm(38,36); 
    for i=1:3:length(randf)
% % % % % show image
% n=n+1;
correctOption=randf(i);
option2= randf(i+1);
option3=randf(i+2);
selectedWord=wordList(correctOption);
address2=strcat(directory2,selectedWord,".jpg");
myimage=imread(address2);
Tex=Screen('MakeTexture',win,myimage);
Screen('DrawTexture',win,Tex,[],[650 100 1150 600]);
% % % % % % Options
rect1=[750,600,1050,700];
rect2=[750,720,1050,820];
rect3=[750,840,1050,940];
Screen('FillRect',win,[97 143 224],rect1)
Screen('FillRect',win,[97 143 224],rect2)
Screen('FillRect',win,[97 143 224],rect3)
rects=[rect1; rect2; rect3];
r=randperm(3,3);
randOption1=r(1);
randOption2=r(2);
randOption3=r(3);
% testedWords(n)= wordList(correctOption)

DrawFormattedText(win, upper(wordList{correctOption}),'center','center',[0,0,0],[],[],[],[],[],rects(randOption1,:))
DrawFormattedText(win, upper(wordList{option2}),'center','center',[0,0,0],[],[],[],[],[],rects(randOption2,:))
DrawFormattedText(win, upper(wordList{option3}),'center','center',[0,0,0],[],[],[],[],[],rects(randOption3,:))

Screen(win,'flip');
pause(1)
while true
[mousex,mousey,buttons]=GetMouse(win);
if buttons(1)==1
       if mousex>rects(randOption1,1)&& mousex<rects(randOption1,3) && mousey>rects(randOption1,2) &&  mousey<rects(randOption1,4) 
           DrawFormattedText(win,correct,'center','center',[0,100,0]);
           Screen(win,'flip');
           playSound('resources\added\win.wav')
           cr=cr+1;
%            responce{n}=wordList{correctOption};
%            score(n,:)=1
          
           break
       elseif mousex>rects(randOption2,1)&& mousex<rects(randOption2,3) && mousey>rects(randOption2,2) &&  mousey<rects(randOption2,4)
           DrawFormattedText(win,Wrong,'center','center',[100,0,0]);
           Screen(win,'flip');
           playSound('resources\added\lose.wav')
           Wr=Wr+1;
%            responce{n}=wordList{option2};
%            score(n,:)=0
          
           break
       elseif mousex>rects(randOption3,1)&& mousex<rects(randOption3,3) && mousey>rects(randOption3,2) &&  mousey<rects(randOption3,4)
           DrawFormattedText(win,Wrong,'center','center',[100,0,0]);
           Screen(win,'flip');
           playSound('resources\added\lose.wav')
           Wr=Wr+1;
%            responce{n}=wordList{option3};
%            score(n,:)=0
         
           break
     
       end       
end
end
Screen(win,'flip');
    end

accuracyText=['your accuracy in this practice is:'];
accuracy =(cr/(cr+Wr))*100;
     Screen('TextSize', win, [40]);
     text1=[,num2str(accuracy),' %'];
     DrawFormattedText(win,accuracyText,'center','center',[0,100,0]);
     DrawFormattedText(win,text1,'center',[600],[0,100,0])
     mainmenu=['Main Menu'];
     Exit=['Exit'];
     rectE=[1000 750 1300 850];
     rectM=[500 750 800 850];
     Screen(win,'flip');
     pause(2)
 if accuracy > 70
     DrawFormattedText(win,welldone,'center','center',[0,100,0]);
   playSound('resources\added\achievement.wav')
 else
     DrawFormattedText(win,fail,'center','center',[100,0,0]);
     playSound('resources\added\lose.wav')
 end
 
%   T = table(date,testedWords',responce' ,score');
     %writetable(T,'final_test.csv','WriteMode','Append');
    % xlswrite ( 'result.xlsx' , [testedWords;responce]);
    
    
 while true
 Screen('FillRect',win,[97 143 224],[500 750 800 850])
 Screen('FillRect',win,[224 90 90],[1000 750 1300 850])
 DrawFormattedText(win,mainmenu,'center','center',[0 0 0],[],[],[],[],[],rectM)
 DrawFormattedText(win,Exit,'center','center',[0 0 0],[],[],[],[],[],rectE)
 [mousex,mousey,buttons]=GetMouse(win);
    if buttons(1)==1;
       if mousex>rectE(1)&& mousex<rectE(3) && mousey>rectE(2) &&  mousey<rectE(4);
           break
       elseif mousex>rectM(1)&& mousex<rectM(3)&& mousey>rectM(2) && mousey<rectM(4);
              MainMenu(win); 
       end
    end
    Screen(win,'flip',[],1);
 end
  sca  
end