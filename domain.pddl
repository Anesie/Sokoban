(define (domain sokoban)
  
  ;;Types
  (:types
   avatar box case direction
  )
  
  ;;Prédicats
  (:predicates
  (location ?a - avatar ?c - case) 
  (locationBox ?b - box ?c - case)
  (connexion ?c1 - case ?c2 - case ?d - direction)
  (free ?c - case)

  )

  (:action move
    :parameters (?a - avatar ?c1- case ?c2 - case ?to - direction)
    :precondition (and 
       (location ?a ?c1)
       (connexion ?c1 ?c2 ?to)
       (free ?c2)
    )
    :effect (and 
        (location ?a ?c2)
        (free ?c1)
        (not (location ?a ?c1 ))
        (not (free ?c2))
    )
  )

  (:action push
    :parameters (?a - avatar ?b - box ?c1 - case ?c2 - case ?c3 - case ?to - direction)
    :precondition (and 
       (location ?a ?c1)
       (locationBox ?b ?c2)
       (connexion ?c1 ?c2 ?to)
       (connexion ?c2 ?c3 ?to)
       (free ?c3)
    )
    :effect (and 
        (location ?a ?c2)
        (free ?c1)
        (not (location ?a ?c1 ))
        (locationBox ?b ?c3)
        (not (locationBox ?b ?c2 ))
        (not (free ?c3))
    )
  )


)