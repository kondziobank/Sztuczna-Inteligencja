(define (domain wilk-koza-kapusta)
  (:types lewy-brzeg prawy-brzeg wilk koza kapusta czlowiek)
  (:predicates
    (pusta-tratwa ?tratwa) 
    (w-polowie-pusta-tratwa ?tratwa)     
    (pelna-tratwa ?tratwa)          
    (na ?cos ?brzeg)               
    (przy-brzegu ?tratwa ?brzeg)            
    (obiekt-na-tratwie ?obiekt ?tratwa)     
  )
  
  (:action czlowiek-na-morzu 
   :parameters(?tratwa)
   :precondition 
        (and 
            (pusta-tratwa ?tratwa)
            (na wilk lewy-brzeg)
            (na koza lewy-brzeg)
            (na kapusta lewy-brzeg)
            (na czlowiek lewy-brzeg)
            (przy-brzegu ?tratwa lewy-brzeg)
        )
                      
   :effect 
        (and    
            (not (pusta-tratwa ?tratwa))
            (w-polowie-pusta-tratwa ?tratwa)
            (not (na czlowiek lewy-brzeg))
            (obiekt-na-tratwie czlowiek ?tratwa)
        )
    )
  
  (:action czlowiek-na-brzegu 
   :parameters(?tratwa)
   :precondition 
        (and 
            (w-polowie-pusta-tratwa ?tratwa)
            (na wilk prawy-brzeg)
            (na koza prawy-brzeg)
            (na kapusta prawy-brzeg)
            (obiekt-na-tratwie czlowiek ?tratwa)
            (przy-brzegu ?tratwa prawy-brzeg)
        )
                      
   :effect 
        (and 
            (pusta-tratwa ?tratwa)
            (not (w-polowie-pusta-tratwa ?tratwa))
            (na czlowiek prawy-brzeg)
            (not (obiekt-na-tratwie czlowiek ?tratwa))
        )
  )
  
  (:action transportuj-pusta-tratwe 
   :parameters (?skad ?do ?tratwa)
   :precondition 
        (and 
            (przy-brzegu ?tratwa ?skad)
            (w-polowie-pusta-tratwa ?tratwa)
        )
   :effect 
        (and 
            (not (przy-brzegu ?tratwa ?skad)) 
            (przy-brzegu ?tratwa ?do)
            (w-polowie-pusta-tratwa ?tratwa)
           )
  )
  

  (:action transportuj 
   :parameters (?skad ?do ?tratwa)
   :precondition 
        (and 
            (not (pusta-tratwa ?tratwa))
            (przy-brzegu ?tratwa ?skad)
            (pelna-tratwa ?tratwa)
        )
   :effect 
        (and 
            (not (przy-brzegu ?tratwa ?skad))
            (przy-brzegu ?tratwa ?do)
            (pelna-tratwa ?tratwa)
        )

  )
  
  (:action wilk-na-tratwie 
   :parameters (?gdzie ?tratwa)
   :precondition 
        (and
            (na wilk lewy-brzeg)
            (na koza lewy-brzeg)
            (na kapusta lewy-brzeg)
            (przy-brzegu ?tratwa lewy-brzeg)
            (na wilk ?gdzie)
            (not (obiekt-na-tratwie wilk ?tratwa))
            (obiekt-na-tratwie czlowiek ?tratwa)
            (w-polowie-pusta-tratwa ?tratwa)
            (przy-brzegu ?tratwa ?gdzie)
                    
        )
    :effect 
        (and 
            (obiekt-na-tratwie wilk ?tratwa)
            (not (w-polowie-pusta-tratwa ?tratwa))
            (pelna-tratwa ?tratwa)
            (not (na wilk ?gdzie))
                 
        )
  )
  
  (:action koza-na-tratwie 
   :parameters (?gdzie ?tratwa)
   :precondition 
        (and
            (or
                (and
                    (na wilk lewy-brzeg)
                    (na koza lewy-brzeg)
                    (na kapusta lewy-brzeg)
                    (przy-brzegu ?tratwa lewy-brzeg)
                )
                        
                (and 
                    (na wilk prawy-brzeg)
                    (na koza prawy-brzeg)
                    (na kapusta prawy-brzeg)
                    (przy-brzegu ?tratwa prawy-brzeg)
                )
                       
                (and 
                    (na wilk prawy-brzeg)
                    (na koza lewy-brzeg)
                    (na kapusta prawy-brzeg)
                    (przy-brzegu ?tratwa lewy-brzeg)
                )
            )
            (obiekt-na-tratwie czlowiek ?tratwa)
            (w-polowie-pusta-tratwa ?tratwa)
            (na koza ?gdzie)
            (not (obiekt-na-tratwie koza ?tratwa))
            (przy-brzegu ?tratwa ?gdzie)
        )
    :effect 
        (and 
            (obiekt-na-tratwie koza ?tratwa)
            (not (w-polowie-pusta-tratwa ?tratwa))
            (pelna-tratwa ?tratwa)
            (not (na koza ?gdzie))
        )
  )

  (:action kapusta-na-tratwie
   :parameters (?gdzie ?tratwa)
   :precondition 
        (and
            (na wilk prawy-brzeg)
            (na koza lewy-brzeg)
            (na kapusta lewy-brzeg)
            (przy-brzegu ?tratwa lewy-brzeg)
                    
            (obiekt-na-tratwie czlowiek ?tratwa)
            (w-polowie-pusta-tratwa ?tratwa)
            (na kapusta ?gdzie)
            (not (obiekt-na-tratwie kapusta ?tratwa))
            (przy-brzegu ?tratwa ?gdzie)
        )
    :effect 
        (and 
            (obiekt-na-tratwie kapusta ?tratwa)
            (not (w-polowie-pusta-tratwa ?tratwa))
            (pelna-tratwa ?tratwa)
            (not (na kapusta ?gdzie))
        )
  )
  


  (:action wyjecie-wilka-z-tratwy
   :parameters (?gdzie ?tratwa)
   :precondition 
        (and
            (przy-brzegu ?tratwa ?gdzie)
            (pelna-tratwa ?tratwa)
            (obiekt-na-tratwie wilk ?tratwa)
            (obiekt-na-tratwie czlowiek ?tratwa)
        )
    :effect 
        (and 
            (not (pelna-tratwa ?tratwa))
            (w-polowie-pusta-tratwa ?tratwa)
            (not (obiekt-na-tratwie wilk ?tratwa))
            (na wilk ?gdzie)
        )
  )

  (:action wyjecie-kozy-z-tratwy
   :parameters (?gdzie ?tratwa)
   :precondition 
        (and
            (przy-brzegu ?tratwa ?gdzie)
            (pelna-tratwa ?tratwa)
            (obiekt-na-tratwie koza ?tratwa)
            (obiekt-na-tratwie czlowiek ?tratwa)
        )
    :effect 
        (and 
            (not (pelna-tratwa ?tratwa))
            (w-polowie-pusta-tratwa ?tratwa)
            (not (obiekt-na-tratwie koza ?tratwa))
            (na koza ?gdzie)
        )
  )
  
  (:action wyjecie-kapusty-z-tratwy
   :parameters (?gdzie ?tratwa)
   :precondition 
        (and
            (przy-brzegu ?tratwa ?gdzie)
            (pelna-tratwa ?tratwa)
            (obiekt-na-tratwie kapusta ?tratwa)
            (obiekt-na-tratwie czlowiek ?tratwa)
        )
    :effect 
        (and 
            (not (pelna-tratwa ?tratwa))
            (w-polowie-pusta-tratwa ?tratwa)
            (not (obiekt-na-tratwie kapusta ?tratwa))
            (na kapusta ?gdzie)
        )
  )  
)  