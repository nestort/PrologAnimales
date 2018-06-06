
start :- consult('BaseConocimientoAnimales.pl'),   
        process_a_query.
process_a_query :- write('Su metodo de naciemiento oviparo o viviparo:'),nl,
                read(Nace),
		write('Es herbivoro o omnivoro:'),nl,
                read(Come),
		write('Tiene pelo, plumas, escamas o solopiel:'),nl,
                read(Tiene),
		write('Es terrestre, acuatico o anfibio:'),nl,
                read(Vive),
		write('Es vertebrado o invertebrado:'),nl,
                read(Estructura), 
	        write('Es bipedo, cuadrupedo, sinpatas o masdecuatro:'),nl,
                read(Patas), 
		write('Es reptil, insecto, ave, mamifero, pez o aracnido:'),nl,
                read(Reino),
        	pregunta(Nace, Come, Tiene, Vive, Estructura, Patas, Reino).

% Si el animal ya se encuentra en la base de conocimientos, entonces retornar devolver
% el nombre de su animal.
                pregunta(Nace, Come, Tiene, Vive, Estructura, Patas, Reino ) :- tiene(Animal,Nace, Come, Tiene, Vive, Estructura, Patas, Reino),
                write('El  '),
                write(Animal),
                write(' es  '),
                write(Nace),
	        write(', '),
                write(Come),
		write(' , tiene  '),
	        write(Tiene),
		write(' vive en  '),
                write(Vive), 
		write(', '),
                write(Estructura), 
	        write(', '),
                write(Patas), 
		write(', '),
                write(Reino),nl,nl,
                write('tu animal es:   '),
                write(Animal),nl,
                read(si),nl,
		(si==si)
		->
                
		write('Quieres volver a intentarlo'),nl,
                read(si),nl,
		(si==si)
		->
                
                process_a_query;
		tell('BaseConocimientoAnimales.pl'),
                listing(tiene),
                told,
                write('Guardado'),nl);
		(si==no)
		->
		pregunta(Nace, Come, Tiene, Vive, Estructura, Patas, Reino);

                write('No se que animal estas pensando.Que animal es? '),nl,
		read(Animal),nl,
		assert(tiene(Animal, Nace, Come, Tiene, Vive, Estructura, Patas, Reino)),
		write('Guardando'),nl,

		write('Quieres reintentar'),nl,
                read(si),nl,
		(si==si)
		->
                process_a_query;

                tell('BaseConocimientoAnimales.pl'),
                listing(tiene),
                told,
                write('Guardado en la base de conocimientos!'),nl.
                

				 
				 
				 