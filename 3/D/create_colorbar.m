load('save1');

mu = mu./255;

for i = 1:16
    rectangle('Position',[i 0 1 1],'EdgeColor','k','FaceColor',mu(i,:))
end