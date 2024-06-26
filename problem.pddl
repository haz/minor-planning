(define (problem triangle-in-square)
    (:domain find-minor)
    (:objects
        o1 o2 o3 o4 - orig
        t1 t2 t3 - target
    )

    (:init
        (active o1)
        (active o2)
        (active o3)
        (active o4)
        (edge o1 o2)
        (edge o2 o3)
        (edge o3 o4)
        (edge o4 o1)
        (edge o2 o1)
        (edge o3 o2)
        (edge o4 o3)
        (edge o1 o4)
        (edge o1 o1)
        (edge o2 o2)
        (edge o3 o3)
        (edge o4 o4)
        (edge t1 t2)
        (edge t2 t3)
        (edge t3 t1)
        (edge t2 t1)
        (edge t3 t2)
        (edge t1 t3)
        (edge t1 t1)
        (edge t2 t2)
        (edge t3 t3)
        (current-edge t1 t2)
        (NEXT t1 t2 t2 t3)
        (NEXT t2 t3 t3 t1)
        (LAST t3 t1)
        (morphing)
    )

    (:goal
        (and
            (done)
        )
    )

)
