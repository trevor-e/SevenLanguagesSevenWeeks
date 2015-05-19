(defn big
  [st n]
  (> (count st) n))

(defn collection-type [col]
  (if (list? col) :list
    (if (map? col) :map
      (if (vector? col) :vector))))

(println (big "test" 2))
(println (big "test" 4))

(println (collection-type '(1 2 3)))
(println (collection-type {:test1 "value1", :test2 "value2"}))
(println (collection-type [1 2 3]))