(def is-taking-customers? (atom true))
(def haircuts-given (agent 0))
(def current-customers (ref 0))
(def max-customers 3)

(defn add-customer
  []
  (future
    (while @is-taking-customers?
      (dosync
        (Thread/sleep (+ (10 (rand-int 20))))
        (if (< (ensure current-customers) max-customers)
          (alter current-customers inc))))))

(defn has-customer?
  []
  (dosync
    (if (< 0 (ensure current-customers))
      (alter current-customers dec))))

(defn do-haircuts
  []
  (future
    (while @is-taking-customers?
      (if (has-customer?)
        (do
          (Thread/sleep 20)
          (send haircuts-given inc))))))

(defn close-shop-after [duration]
  (do (Thread/sleep duration) (reset! is-taking-customers? false)))

(do
  (println "Starting...")
  (do-haircuts)
  (add-customer)
  (close-shop-after 3000)
  (println "Haircuts given: " @haircuts-given)
  (System/exit 0))