(ns clj.core
  (:gen-class))

(def a (double-array (map #(Math/sin (* Math/PI (/ (double %) 8.0))) (range 5000))))
(def b (double-array (map #(Math/cos (* Math/PI (/ (double %) 8.0))) (range 5000))))

(defn convolve [^doubles kernel-array ^doubles data-array]
  (let [ks (count kernel-array)
        ds (count data-array)
        output (double-array (+ ks ds))
        factor (/ 1.0 (areduce kernel-array i ret 0.0 (+ ret (aget kernel-array i))))]
    (dotimes [i (int ds)]
      (dotimes [j (int ks)]
        (let [offset (int (+ i j))]
          (aset output offset (+ (aget output offset) (* factor (* (aget data-array i) (aget kernel-array j))))))))
    output))

(defn -main
  []
  (dotimes [_ 1000]
  	(time (convolve a b))))
