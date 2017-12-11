(in-package #:cl-user)

(defun distance (input)
  (with-open-file (s input :direction :input)
    (let ((x 0)
	  (y 0)
	  (max 0)
	  (last 0))
      (loop for direction in (read-from-string (format nil "(~A)" (nsubstitute #\Space #\, (read-line s)))) do
	   (case direction
	     (n (incf y 2))
	     (s (decf y 2))
	     (sw (decf x) (decf y))
	     (se (incf x) (decf y))
	     (nw (decf x) (incf y))
	     (ne (incf x) (incf y)))
	   (setf max (max max (setf last (let ((ax (abs x))
					       (ay (abs y)))
					   (+ ax (/ (- ay ax) 2)))))))
      (values last max))))
