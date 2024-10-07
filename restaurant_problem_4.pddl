(define (problem restaurant_4)
    (:domain restaurant)

    (:objects
        self - robot
        g1 - group
        g2 - group
        g3 - group
        g4 - group
        g5 - group
        t1 - table
        t2 - table
        t3 - table
    )

    (:init
        (isQueued g1)
        (isQueued g2)
        (isQueued g3)
        (isQueued g4)
        (isQueued g5)
        (isFreeT t1)
        (isFreeT t2)
        (isFreeT t3)
        (= (total-cost) 0)
        (= (battery-level) 100)
        (= (group-size g1) 2)
        (= (group-size g2) 2)
        (= (group-size g3) 4)
        (= (group-size g4) 10)
        (= (group-size g5) 5)
        (= (table-size t1) 2)
        (= (table-size t2) 10)
        (= (table-size t3) 4)
        (= (total-group-queue) 5)
        (= (total-profit) 0)
        (= (total-table-free) 3)                
        (= (seated-groups) 0)
        (= (max-restaurant-capacity-daily) 5)
    )

    (:goal (and
                (= (total-group-queue) 0)     
                (= (total-table-free) 3)
                (= (seated-groups) (max-restaurant-capacity-daily))
            )
    )

    (:metric minimize (total-cost)
    )
)
