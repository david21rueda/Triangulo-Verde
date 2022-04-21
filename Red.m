clear;
clc;

%Triangulo Verde
t1A=Atributos('triangulo1.png');
t2A=Atributos('triangulo2.png');
t3A=Atributos('triangulo3.png');
t4A=Atributos('triangulo4.png');
t5A=Atributos('triangulo5.png');
t6A=Atributos('triangulo6.png');
t7A=Atributos('triangulo7.png');
t8A=Atributos('triangulo8.png');
t9A=Atributos('triangulo9.png');
t10A=Atributos('triangulo10.png');

%figuras diferentes
o1A=Atributos('objeto1.png');
o2A=Atributos('objeto2.png');
o3A=Atributos('objeto3.png');
o4A=Atributos('objeto4.png');
o5A=Atributos('objeto5.png');
o6A=Atributos('objeto6.png');
o7A=Atributos('objeto7.png');
o8A=Atributos('objeto8.png');
o9A=Atributos('objeto9.png');
o10A=Atributos('objeto10.png');

x=[t1A;t2A;t3A;t4A;t5A;t6A;t7A;t8A;t9A;t10A;o1A;o2A;o3A;o4A;o5A;o6A;o7A;o8A;o9A;o10A];

%etiquetas
t=[1;1;1;1;1;1;1;1;1;1];
o=[2;2;2;2;2;2;2;2;2;2];

etiquetas=[t;o];
x2=x';
y2=etiquetas';

red = feedforwardnet (50);
red=train(red,x2,y2);

