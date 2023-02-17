fourfivedata=readtable('4.5 mm.txt');
fourfivenewdata=table2array(fourfivedata);
fourfivexdata=fourfivenewdata(:,1);
fourfiveydata=fourfivenewdata(:,2);
plot(fourfivexdata,fourfiveydata)
%finds all local maxima
[fourfivemaximum,fourfivek]=islocalmax(fourfiveydata)
%what are the nine largest local maxima (nine peaks)
[fourfivemax,fourfivex]=maxk(fourfivek,9)
fourfivewavelength=[]
%returns the x values for each peak
for input=fourfivex(:,1)
    newval=fourfivexdata(fourfivex)
    fourfivewavelength = [fourfivewavelength newval]
end
%finds the difference between the first and last peak 
fourfivepeakonemax=mink(fourfivewavelength,1)
fourfivepeakthreemax=maxk(fourfivewavelength,1)
fourfivedifference= fourfivepeakthreemax-fourfivepeakonemax
%%
%this is just a copy past of previous code for the next file etc
fivefivedata=readtable('5.5 mm.txt');
fivefivenewdata=table2array(fivefivedata);
fivefivexdata=fivefivenewdata(:,1);
fivefiveydata=fivefivenewdata(:,2);
plot(fivefivexdata,fivefiveydata)
 

[fivefivemaximum,fivefivek]=islocalmax(fivefiveydata)


[fivefivemax,fivefivex]=maxk(fivefivek,9)
fivefivewavelength=[]


for input=fivefivex(:,1)
    newval=fivefivexdata(fivefivex)
    fivefivewavelength = [fivefivewavelength newval]
end

fivefivepeakonemax=mink(fivefivewavelength,1)
fivefivepeakthreemax=maxk(fivefivewavelength,1)
fivefivedifference= fivefivepeakthreemax-fivefivepeakonemax
%%
sixfivedata=readtable('6.5 mm.txt');
sixfivenewdata=table2array(sixfivedata);
sixfivexdata=sixfivenewdata(:,1);
sixfiveydata=sixfivenewdata(:,2);
plot(sixfivexdata,sixfiveydata)
 

[sixfivemaximum,sixfivek]=islocalmax(sixfiveydata)


[sixfivemax,sixfivex]=maxk(sixfivek,9)
sixfivewavelength=[]


for input=sixfivex(:,1)
    newval=sixfivexdata(sixfivex)
    sixfivewavelength = [sixfivewavelength newval]
end

sixfivepeakonemax=mink(sixfivewavelength,1)
sixfivepeakthreemax=maxk(sixfivewavelength,1)
sixfivedifference= sixfivepeakthreemax-sixfivepeakonemax
%%
sevenfivedata=readtable('7.5 mm.txt');
sevenfivenewdata=table2array(sevenfivedata);
sevenfivexdata=sevenfivenewdata(:,1);
sevenfiveydata=sevenfivenewdata(:,2);
plot(sevenfivexdata,sevenfiveydata)
 

[sevenfivemaximum,sevenfivek]=islocalmax(sevenfiveydata)


[sevenfivemax,sevenfivex]=maxk(sevenfivek,9)
sevenfivewavelength=[]


for input=sevenfivex(:,1)
    newval=sevenfivexdata(sevenfivex)
    sevenfivewavelength = [sevenfivewavelength newval]
end

sevenfivepeakonemax=mink(sevenfivewavelength,1)
sevenfivepeakthreemax=maxk(sevenfivewavelength,1)
sevenfivedifference= sevenfivepeakthreemax-sevenfivepeakonemax
