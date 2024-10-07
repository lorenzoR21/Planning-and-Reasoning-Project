(define (problem restaurant_2)
    (:domain restaurant)

    (:objects
        self - robot
        g1 - group
        g2 - group
        g3 - group
        g4 - group
        g5 - group
        g6 - group
        t1 - table
        t2 - table
        t3 - table
        t4 - table
    )

    (:init
        (isQueued g1)
        (isQueued g2)
        (isQueued g3)
        (isQueued g4)
        (isQueued g5)
        (isQueued g6)
        (isFreeT t1)
        (isFreeT t2)
        (isFreeT t3)
        (isFreeT t4)
        (= (total-cost) 0)
        (= (battery-level) 100)
        (= (group-size g1) 2)
        (= (group-size g2) 3)
        (= (group-size g3) 4)
        (= (group-size g4) 4)
        (= (group-size g5) 10)
        (= (group-size g6) 7)
        (= (table-size t1) 2)
        (= (table-size t2) 10)
        (= (table-size t3) 4)
        (= (table-size t4) 5)
        (= (total-group-queue) 6)
        (= (total-profit) 0)
        (= (total-table-free) 4)
        (= (seated-groups) 0)
        (= (max-restaurant-capacity-daily) 6)
    )

    (:goal (and
                (= (total-group-queue) 0)
                (= (total-table-free) 4)
                (= (seated-groups) (max-restaurant-capacity-daily))
            )
    )
)
