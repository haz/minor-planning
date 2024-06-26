
; domain to find if a minor exists within a graph (contractions, edge deletion, and node deletion)

(define (domain find-minor)

    (:requirements :strips :typing :adl :equality)

    (:types
        node - object
        orig target - node
    )

    (:predicates
        (edge ?n1 ?n2 - node)
        (active ?n - orig)
        (matched ?n - node)
        (mapping ?n1 - orig ?n2 - target)
        (morphing)
        (done)

        ; ignored for this domain version
        (validating)
        (queued)
        (current-edge ?n1 ?n2 - target)
        (NEXT ?n1 ?n2 ?n3 ?n4 - target)
        (LAST ?n1 ?n2 - target)
    )

    ; Delete a node
    (:action delete-node
        :parameters (?n - orig)
        :precondition (and (active ?n) (morphing))
        :effect (and (not (active ?n)))
    )

    ; Delete an edge
    (:action delete-edge
        :parameters (?n1 ?n2 - orig)
        :precondition (and (edge ?n1 ?n2) (morphing))
        :effect (and (not (edge ?n1 ?n2)) (not (edge ?n2 ?n1)))
    )

    ; Contract an edge
    ;  - use the first node as the new node
    ;  - delete the second node
    ;  - add edges from the new node to all the neighbors of the second node
    (:action contract-edge
        :parameters (?n1 ?n2 - orig)
        :precondition (and (edge ?n1 ?n2) (active ?n1) (active ?n2) (morphing))
        :effect (and
            (not (active ?n2))
            (forall
                (?n3 - orig)
                (when
                    (and (edge ?n2 ?n3) (active ?n3))
                    (and (edge ?n1 ?n3) (edge ?n3 ?n1))
                )
            )
        )
    )

    ; match a node
    (:action match
        :parameters (?n1 - orig ?n2 - target)
        :precondition (and
            (active ?n1)
            (not (matched ?n1))
            (not (matched ?n2))
        )
        :effect (and
            (matched ?n1)
            (matched ?n2)
            (mapping ?n1 ?n2)
            (not (morphing))
        )
    )


    ; check isomorphism
    (:action isomorphism
        :parameters ()
        :precondition (and
            ; all target nodes have a match
            (forall
                (?n - target)
                (matched ?n))
            ; all active original nodes have a match
            (forall
                (?n1 - orig)
                (imply
                    (active ?n1)
                    (exists
                        (?n2 - target)
                        (mapping ?n1 ?n2)))
            )
            ; all edges are preserved
            (forall
                (?n1 ?n2 - orig ?n3 ?n4 - target)
                (and
                    (imply
                        (and
                            (edge ?n1 ?n2)
                            (mapping ?n1 ?n3)
                            (mapping ?n2 ?n4))
                        (edge ?n3 ?n4))
                    (imply
                        (and
                            (edge ?n3 ?n4)
                            (mapping ?n1 ?n3)
                            (mapping ?n2 ?n4))
                        (edge ?n1 ?n2))
                )
            )
        )
        :effect (done)
    )

)