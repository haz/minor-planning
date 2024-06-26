
; Planar graphs shouldn't have a minor of K5 or K3,3. Checking for K5 here.

(define (problem C6-planar)
    (:domain find-minor)
    (:objects
        o1 o2 o3 o4 o5 o6 - orig
        t1 t2 t3 t4 t5 - target
    )

    (:init
        
        (active o1)
        (active o2)
        (active o3)
        (active o4)
        (active o5)
        (active o6)

        ; C5
        (edge o1 o2)
        (edge o2 o3)
        (edge o3 o4)
        (edge o4 o5)
        (edge o5 o6)
        (edge o6 o1)

        (edge o2 o1)
        (edge o3 o2)
        (edge o4 o3)
        (edge o5 o4)
        (edge o6 o5)
        (edge o1 o6)

        ; Self loops
        (edge o1 o1)
        (edge o2 o2)
        (edge o3 o3)
        (edge o4 o4)
        (edge o5 o5)
        (edge o6 o6)

        ; K5
        (edge t1 t1)
        (edge t1 t2)
        (edge t1 t3)
        (edge t1 t4)
        (edge t1 t5)
        (edge t2 t1)
        (edge t2 t2)
        (edge t2 t3)
        (edge t2 t4)
        (edge t2 t5)
        (edge t3 t1)
        (edge t3 t2)
        (edge t3 t3)
        (edge t3 t4)
        (edge t3 t5)
        (edge t4 t1)
        (edge t4 t2)
        (edge t4 t3)
        (edge t4 t4)
        (edge t4 t5)
        (edge t5 t1)
        (edge t5 t2)
        (edge t5 t3)
        (edge t5 t4)
        (edge t5 t5)

        (morphing)

        ; Used for the edge queue domain version
        ;  Only need to check one direction of the non-self loops
        (current-edge t1 t2)
        (NEXT t1 t2 t1 t3)
        (NEXT t1 t3 t1 t4)
        (NEXT t1 t4 t1 t5)
        (NEXT t1 t5 t2 t3)
        (NEXT t2 t3 t2 t4)
        (NEXT t2 t4 t2 t5)
        (NEXT t2 t5 t3 t4)
        (NEXT t3 t4 t3 t5)
        (NEXT t3 t5 t4 t5)
        (LAST t4 t5)
    )

    (:goal
        (and
            (done)
        )
    )

)
