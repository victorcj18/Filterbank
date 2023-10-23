function [EEGfilt] = filterbank(EEGSignal,Fs,fa,fb)

%Función desarrollada por Cúcucta @elpropicucuta y no por los perezoso de
%estancia.


    Wna      = fa/(Fs/2);
    Wnb      = fb/(Fs/2);
    
    M       = 6;
    [BH,AH]   = butter(M,[Wna Wnb],'bandpass');


    for ChaNum=1:length(EEGSignal(:,1,1))
        for j=1:length(EEGSignal(:,1,:))
    
            EEGfilt(ChaNum,:) = filtfilt(BH,AH,EEGSignal(ChaNum,:,j));
        end

    end


%     disp( strcat('signal filtered with Butterworth with order 6 and low frecuency =',num2str(fa),' Hz and hig frecuency =', num2str(fb)));

end