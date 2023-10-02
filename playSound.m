function playSound(address)
[data, sampling_rate] =audioread(address);
pahandle = PsychPortAudio('Open', [], [], [], sampling_, 1, [], []);
PsychPortAudio('FillBuffer',pahandle,data');
PsychPortAudio('Start',pahandle);
WaitSecs(1);
PsychPortAudio('Close',pahandle);
end


            