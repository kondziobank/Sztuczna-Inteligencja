(define
    (domain rodzinna-przeprawa)
    (:requirements :adl)
    (:predicates
        (dorosly-po-lewej ?dorosly)
        (dziecko-po-lewej ?dziecko)
        (tratwa-po-lewej ?tratwa)
        
        (dorosly-po-prawej ?dorosly)
        (dziecko-po-prawej ?dziecko)
        (tratwa-po-prawej ?tratwa)
    )
    
    (:action przeplyn-dorosly-prawo
        :parameters (?dorosly ?tratwa)
        :precondition
        (and
            (dorosly-po-lewej ?dorosly)
            (tratwa-po-lewej ?tratwa)
        )
        :effect
        (and
            (dorosly-po-prawej ?dorosly)
            (tratwa-po-prawej ?tratwa)
            (not(dorosly-po-lewej ?dorosly))
            (not(tratwa-po-lewej ?tratwa))
        )
    )
    
        (:action przeplyn-dzieci-prawo
        :parameters (?dziecko1 ?dziecko2 ?tratwa)
        :precondition
        (and
            (dziecko-po-lewej ?dziecko1)
            (dziecko-po-lewej ?dziecko2)
            (tratwa-po-lewej ?tratwa)
        )
        :effect
        (and
            (dziecko-po-prawej ?dziecko1)
            (dziecko-po-prawej ?dziecko2)
            (tratwa-po-prawej ?tratwa)
            (not(dziecko-po-lewej ?dziecko1))
            (not(dziecko-po-lewej ?dziecko2))
            (not(tratwa-po-lewej ?tratwa))
        )
    )
    
        (:action przeplyn-dziecko-lewo
        :parameters (?dziecko ?tratwa)
        :precondition
        (and
            (dziecko-po-prawej ?dziecko)
            (tratwa-po-prawej ?tratwa)
        )
        :effect
        (and
            (dziecko-po-lewej ?dziecko)
            (tratwa-po-lewej ?tratwa)
            (not(dziecko-po-prawej ?dziecko))
            (not(tratwa-po-prawej ?tratwa))
        )
    )
)