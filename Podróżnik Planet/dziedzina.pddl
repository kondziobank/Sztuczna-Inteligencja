(define
    (domain podroznik-planet)
    (:requirements :adl :quantified-preconditions)
    (:predicates
        (l-somsiady ?x ?y)
        (l-na ?pole ?gwiazdka)
        (teleport ?p1 ?p2 ?t)
        (somsiady ?p1 ?p2)
        (ludzik ?pole)
        (centrum-sterowania-gwiazdozbiorami ?pole)
        (podniesiona ?d)
        (rozwiazana)
        (dzwignia-na ?x ?y)
    )

    (:action l-przesun
        :parameters (?gwiazdka ?skad ?gdzie ?planeta)
        :precondition
        (and
            (ludzik ?planeta)
            (centrum-sterowania-gwiazdozbiorami ?planeta)
            (l-na ?skad ?gwiazdka)
            (l-somsiady ?skad ?gdzie)
            (not (exists (?y) (l-na ?gdzie ?y)))
        )
        :effect
        (and
            (not (l-na ?skad ?gwiazdka))
            (l-na ?gdzie ?gwiazdka)
        )
    )
    
    (:action podnies-dzwignie
        :parameters (?planeta ?dzwignia)
        :precondition
        (and
            (ludzik ?planeta)
            (not (podniesiona ?dzwignia))
            (dzwignia-na ?dzwignia ?planeta)
        )
        :effect
        (and
            (podniesiona ?dzwignia)
        )
    )
    
    (:action teleportuj
        :parameters (?skad ?gdzie ?dzwignia)
        :precondition
        (and
            (ludzik ?skad)
            (teleport ?skad ?gdzie ?dzwignia)
            (podniesiona ?dzwignia)
        )
        :effect
        (and
            (not (podniesiona ?dzwignia))
            (not (ludzik ?skad))
            (ludzik ?gdzie)
        )
    )
    
    (:action teleportuj-bez-dzwigni
        :parameters (?skad ?gdzie)
        :precondition
        (and
            (ludzik ?skad)
            (somsiady ?skad ?gdzie)
        )
        :effect
        (and
            (not (ludzik ?skad))
            (ludzik ?gdzie)
        )
    )
)

