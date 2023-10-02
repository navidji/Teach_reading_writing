% function wordTest(wordList, win)
% end
Screen('Preference' , 'SkipSyncTests' , 1)
[win,screenrect]= Screen('OpenWindow',0,[256,256,256],[0 0 1800 1000]);
Screen('TextSize', win, [40]);
directory2=["AssFinalFiles\images\"];
allWords= ["ant","bat","canary","cat","dog","duck","eagle","fox","goat","goose","koala","lion","mole","penguin","pig","rabbit","sheep","skunk","swan","tiger","zebra","axe","belt","brush","cape","dress","hat","jcaket","ladder","pencil","shirt","banana","cherry","kiwi","lemon","peach","pumpkin","tomato"]
randf=randperm(38,3)

% % % % % show image
option1=randf(1);
selectedWord=allWords(option1)
address2=strcat(directory2,selectedWord,".jpg");
myimage=imread(address2);
Tex=Screen('MakeTexture',win,myimage);
Screen('DrawTexture',win,Tex,[],[650 100 1150 600]);

alreadySeen= option1;
option2= randf(2);
option3=randf(3);

DrawFormattedText(win, upper(allWords{option1}),[500],[650],[0,0,0])
DrawFormattedText(win, upper(allWords{option2}),[600],[650],[0,0,0])
DrawFormattedText(win, upper(allWords{option3}),[700],[650],[0,0,0])


Screen(win,'flip');
pause(2);




