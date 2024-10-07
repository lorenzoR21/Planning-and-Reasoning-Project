(define (domain restaurant)
    (:requirements :strips :typing :action-costs)

    (:types
        robot
        table
        group
    )

    (:predicates
        (isQueued ?g - group)
        (isAtTable ?g - group ?t - table)
        (isServed ?g - group)
        (hasOrdered ?g - group)
        (hasPaid ?g - group)
        (isFreeT ?t - table)
        (discharge ?r - robot)
        (canOrder ?g - group)
        (infinite-battery)
    )

    (:functions
        (total-cost)
        (battery-level)
        (group-size ?g - group)
        (table-size ?t - table)
        (total-group-queue)
        (total-profit)
        (total-table-free)
        (seated-groups)
        (max-restaurant-capacity-daily)
    )

    (:action bringToTheTable1
        :parameters (?g - group ?t - table)
        :precondition (and
                           (>= (total-table-free) 1)
                           (>= (total-group-queue) 1)
                           (>= (table-size ?t) (group-size ?g))
                           (isQueued ?g)
                           (isFreeT ?t)
                           (> (battery-level) 0)
                           (= (seated-groups) 0)
                           (<= (seated-groups) (max-restaurant-capacity-daily))
                      )
        :effect (and
                    	    (not (isQueued ?g))
                            (not (isFreeT ?t))
                            (isAtTable ?g ?t)
                            (canOrder ?g)
                            (decrease (total-table-free) 1)
                            (decrease (total-group-queue) 1)
                            (decrease (battery-level) 1)
                            (increase (total-cost) (+ (* (- (table-size ?t) (group-size ?g)) 6) (group-size ?g)))
                            (increase (seated-groups) 1)                       	                            	                            	                           
                        )
    )
    
    (:action bringToTheTable2
        :parameters (?g - group ?t - table)
        :precondition (and
                           (>= (total-table-free) 1)
                           (>= (total-group-queue) 1)
                           (>= (table-size ?t) (group-size ?g))
                           (isQueued ?g)
                           (isFreeT ?t)
                           (> (battery-level) 0)
                           (= (seated-groups) 1)
                           (<= (seated-groups) (max-restaurant-capacity-daily))
                      )
        :effect (and
                    	    (not (isQueued ?g))
                            (not (isFreeT ?t))
                            (isAtTable ?g ?t)
                            (canOrder ?g)
                            (decrease (total-table-free) 1)
                            (decrease (total-group-queue) 1)
                            (decrease (battery-level) 1)
                            (increase (total-cost) (+ (* (- (table-size ?t) (group-size ?g)) 5) (/ (group-size ?g) 2)))
                            (increase (seated-groups) 1)                       	                            	                            	                           
                        )
    )

    (:action bringToTheTable3
        :parameters (?g - group ?t - table)
        :precondition (and
                           (>= (total-table-free) 1)
                           (>= (total-group-queue) 1)
                           (>= (table-size ?t) (group-size ?g))
                           (isQueued ?g)
                           (isFreeT ?t)
                           (> (battery-level) 0)
                           (= (seated-groups) 2)
                           (<= (seated-groups) (max-restaurant-capacity-daily))
                      )
        :effect (and
                    	    (not (isQueued ?g))
                            (not (isFreeT ?t))
                            (isAtTable ?g ?t)
                            (canOrder ?g)
                            (decrease (total-table-free) 1)
                            (decrease (total-group-queue) 1)
                            (decrease (battery-level) 1)
                            (increase (total-cost) (+ (* (- (table-size ?t) (group-size ?g)) 4) (/ (group-size ?g) 3)))
                            (increase (seated-groups) 1)                       	                            	                            	                           
                        )
    )

    (:action bringToTheTable4
        :parameters (?g - group ?t - table)
        :precondition (and
                           (>= (total-table-free) 1)
                           (>= (total-group-queue) 1)
                           (>= (table-size ?t) (group-size ?g))
                           (isQueued ?g)
                           (isFreeT ?t)
                           (> (battery-level) 0)
                           (= (seated-groups) 3)
                           (<= (seated-groups) (max-restaurant-capacity-daily))
                      )
        :effect (and
                    	    (not (isQueued ?g))
                            (not (isFreeT ?t))
                            (isAtTable ?g ?t)
                            (canOrder ?g)
                            (decrease (total-table-free) 1)
                            (decrease (total-group-queue) 1)
                            (decrease (battery-level) 1)
                            (increase (total-cost) (+ (* (- (table-size ?t) (group-size ?g)) 3) (/ (group-size ?g) 4)))
                            (increase (seated-groups) 1)                       	                            	                            	                           
                        )
    )
    
    (:action bringToTheTable5
        :parameters (?g - group ?t - table)
        :precondition (and
                           (>= (total-table-free) 1)
                           (>= (total-group-queue) 1)
                           (>= (table-size ?t) (group-size ?g))
                           (isQueued ?g)
                           (isFreeT ?t)
                           (> (battery-level) 0)
                           (>= (seated-groups) 4)
                           (<= (seated-groups) (max-restaurant-capacity-daily))
                      )
        :effect (and
                    	    (not (isQueued ?g))
                            (not (isFreeT ?t))
                            (isAtTable ?g ?t)
                            (canOrder ?g)
                            (decrease (total-table-free) 1)
                            (decrease (total-group-queue) 1)
                            (decrease (battery-level) 1)
                            (increase (total-cost) (+ (* (- (table-size ?t) (group-size ?g)) 2) (/ (group-size ?g) 6)))
                            (increase (seated-groups) 1)                       	                            	                            	                           
                        )
    )

    (:action takeOrder
        :parameters (?g - group)
        :precondition (and
                            (canOrder ?g)
                            (>= (battery-level) (* (group-size ?g) 2))
                            (or
                            	(not 
                            		(exists (?g1 - group ?t1 - table) (and (isQueued ?g1) (isFreeT ?t1) (>= (table-size ?t1) (group-size ?g1))))
                            	)
                            	(= (seated-groups) (max-restaurant-capacity-daily))
                            )
                      )
        :effect (
                    and
                        (hasOrdered ?g)
                        (not (canOrder ?g))
                        (increase (total-cost) (* (group-size ?g) 2))
                        (decrease (battery-level) (* (group-size ?g) 2))
                )
    )

    (:action serve
        :parameters (?g - group)
        :precondition (and
                            (hasOrdered ?g)
                            (>= (battery-level) (* (group-size ?g) 3))
                      )
        :effect (
                    and
                        (isServed ?g)
                        (not (hasOrdered ?g))
                        (increase (total-cost) (* (group-size ?g) 3))     
                        (decrease (battery-level) (* (group-size ?g) 3))
                )
    )

    (:action clearTable
        :parameters (?g - group ?t - table)
        :precondition (and
                            (isServed ?g)
                            (>= (battery-level) (table-size ?t))
                            (isAtTable ?g ?t)
                      )
        :effect (
                    and
                        (not (isServed ?g))
                        (hasPaid ?g)
                        (isFreeT ?t)
                        (increase (total-cost) (table-size ?t))
                        (decrease (battery-level) (table-size ?t))
                        (increase (total-table-free) 1)
                        (increase (total-profit) (* (/ 1 (group-size ?g)) 100))
                )
    )

    (:action charge20
        :parameters (?r - robot)
        :precondition (and 
        		(not (infinite-battery))
        		(and (< (battery-level) 100) (>= (battery-level) 80)) 
        	      )
        :effect (
                    and
                        (assign (battery-level) 100)
                        (increase (total-cost) 40)
                )
    )
    
    (:action charge40
        :parameters (?r - robot)
        :precondition (and 
        		(not (infinite-battery))
        		(and (< (battery-level) 80) (>= (battery-level) 60)) 
        	      )
        :effect (
                    and
                        (assign (battery-level) 100)
                        (increase (total-cost) 60)
                )
    )

    (:action charge60
        :parameters (?r - robot)
        :precondition (and 
        		(not (infinite-battery))
        		(and (< (battery-level) 60) (>= (battery-level) 40)) 
        	      )
        :effect (
                    and
                        (assign (battery-level) 100)
                        (increase (total-cost) 80)
                )
    )
    
    (:action charge80
        :parameters (?r - robot)
        :precondition (and 
        		(not (infinite-battery))
        		(and (< (battery-level) 40) (>= (battery-level) 20)) 
        	      )
        :effect (
                    and
                        (assign (battery-level) 100)
                        (increase (total-cost) 100)
                )
    )
    
    (:action charge100
        :parameters (?r - robot)
        :precondition (and 
        		(not (infinite-battery))
        		(and (< (battery-level) 20) (>= (battery-level) 0)) 
        	      )
        :effect (
                    and
                        (assign (battery-level) 100)
                        (increase (total-cost) 120)
                )
    )
)
