function [x]=AtributosCamara(imagen)
    Ima = imresize(imagen,[150,150]);
    r=Ima(:,:,1);
    g=Ima(:,:,2);
    resta=g-r;
    umbral=graythresh(resta);%calcular un umbral para la binarización
    binario=imbinarize(resta,umbral);%binarizar imagen
    ste = strel('line',5,5);
    dilata = imdilate(binario,ste);
    filtr=bwareaopen(dilata,25);
    IIma = imresize(filtr,[150,150]);
    atributos = extractLBPFeatures(IIma,'CellSize',[150 150],'Normalization','None');
    x=atributos;
end


