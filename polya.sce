funcprot(0) // évite l'avertissement réécrire fonction
//function nouveau=suivant(actuel,nombreBoules)
//  alea = grand(1,1,"uin",1,nombreBoules)
//  if (alea<=actuel)
//    nouveau=actuel+1
//  else 
//    nouveau=actuel
//  end
//endfunction

function nouveau=suivant(actuel,nombreBoules)
  [Nech,_]=size(actuel)
  alea = grand(Nech,1,"uin",1,nombreBoules)
  nouveau = actuel+(alea<=actuel)
endfunction

Nech = 2 // taille de l'échantillon 
T = 5    // durée de simulation 

actuel = ones(Nech,1)
nombre = []
proportion = []
for nombreBoules = 2:T
  nombre = [nombre,actuel]
  proportion = [proportion,actuel/nombreBoules]
  actuel = suivant(actuel,nombreBoules)
end
clf()
a = gca()
a.isoview = "on"
subplot(121)
  title("nombre de bleues")
  plot(nombre')
subplot(122)
  title("proportion de bleues")
  plot(proportion')
