clear
clc
load('nn.mat')
vid=videoinput('winvideo', 1,'YUY2_640x480');
start(vid)

exit=0;
while(exit~=3)
    
    webcam = getsnapshot(vid);
    camara=ycbcr2rgb(webcam);
    camaramostrar=camara;
    imshow(camara);
    camaraAtributos=AtributosCamara(camara);
    camA=camaraAtributos';
    %Aqui vamos a binarizar la imagen de la camara para poder sacar region
    %props
    r=camara(:,:,1);
    g=camara(:,:,2);
    res=g-r;
    umbr=graythresh(res);
    bina=imbinarize(res,umbr);
    imshow(bina);
    se = strel('line',5,5);
    dil = imdilate(bina,se);
    fil=bwareaopen(dil,55);
    [camara,c]=bwlabel (fil);
    
    if (c==0)
        text (10,10,'No se encontro una forma','Color','y' )
        exit=exit+1;
    else
        exit=0;
        dec=sim(red,camA);
        producto=round(dec);
        prop=regionprops(camara,'Perimeter','Area','Centroid','BoundingBox');%propiedades de la region
        esquina=prop(1).BoundingBox;
        centro=prop(1).Centroid;
        display(producto)
        if (producto==1)
            imshow(camaramostrar);
            rectangle('Position',[esquina(1),esquina(2),esquina(3),esquina(4)],'Curvature',[1 1],'EdgeColor','r','LineWidth',2);
            text (centro(1),centro(2),'Triangulo de color verde','Color','Y');
        else
            imshow(camaramostrar)
            rectangle('Position',[esquina(1),esquina(2),esquina(3),esquina(4)],'Curvature',[1 1],'EdgeColor','r','LineWidth',2);
            text (centro(1),centro(2),'Figura verde no identificada','Color','y');
        end
    end
end
