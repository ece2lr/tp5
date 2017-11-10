funcprot(0) // évite l'avertissement réécrire fonction
//function nouveau=suivant(actuel)
//  alea = grand(1,1,"uin",1,4)
//  if (alea>actuel)
//    nouveau=actuel+1
//  else 
//    nouveau=actuel-1
//  end
//endfunction

function nouveau=suivant(actuel)
  [Nech,_]=size(actuel)
  alea = grand(Nech,1,"uin",1,n)
  nouveau = actuel+(2*(alea>actuel)-1)
endfunction

function autoHistplot(echantillon)
  mini = min(echantillon)-1
  maxi = max(echantillon)
  histplot(mini:maxi,echantillon)
endfunction

n = 30            // nombre de boules
Nech = 5*10^1     // taille de l'échantillon 
T = 50            // durée de simulation 

actuel = grand(Nech,1,"bin",n,.5)
//actuel = grand(Nech,1,"unf",0,n)
//actuel = zeros(Nech,1)
suite = []
for k = 1:T
  suite = [suite,actuel]
  actuel = suivant(actuel)
end

clf()
subplot(121)
  plot(0:n,binomial(.5,n))
  autoHistplot(suite(:,1))
  title("distribution initiale")
subplot(122)
  plot(0:n,binomial(.5,n))
  autoHistplot(suite(:,$))
  title("distribution finale")
