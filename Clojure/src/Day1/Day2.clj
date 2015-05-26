(defmacro unless [predicate a b]
  `(if-not ~predicate ~a ~b))

(unless false (println "Unless is false") (println "Else"))
(unless true (println "Unless is false") (println "Else"))

(defprotocol Employee
  (taxes [E]))

(defrecord BostonEmployee [name salary]
  Employee
  (taxes [self] (* (:salary self) 0.3)))

(def trevor (BostonEmployee. "Trevor Elkins" 1000000))
(println (-> trevor :name))
(println (-> trevor :salary))
(println (taxes trevor))