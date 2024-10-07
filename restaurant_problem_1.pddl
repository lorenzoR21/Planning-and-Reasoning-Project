(define (problem restaurant_1)
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
        (infinite-battery)
        (= (total-cost) 0)
        (= (battery-level) 1000000000000)
        (= (group-size g1) 2)
        (= (group-size g2) 2)
        (= (group-size g3) 2)
        (= (group-size g4) 2)
        (= (group-size g5) 2)
        (= (group-size g6) 2)
        (= (table-size t1) 2)
        (= (table-size t2) 4)
        (= (table-size t3) 2)
        (= (table-size t4) 2)
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
